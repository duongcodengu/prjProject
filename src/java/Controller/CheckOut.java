/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dao.CartDao;
import Dao.OrderDAO;
import Model.CartDTO;
import Model.Order;
import Model.OrderItem;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="CheckOut", urlPatterns={"/checkout"})
public class CheckOut extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOut</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOut at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("LogUser");
        if (u == null) {
            response.sendRedirect("login");
            return;
        }
       
        CartDao cd = new CartDao();
        List<CartDTO> list = cd.getAllCartByBuyerId(u.getId());
        
        request.setAttribute("cart", list);

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Lấy thông tin địa chỉ giao hàng từ form
        String buyerAddress = request.getParameter("buyerAddress");

         HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LogUser");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        
        
        CartDao cd = new CartDao();
        List<CartDTO> cartList = cd.getAllCartByBuyerId(user.getId());
        if (cartList == null || cartList.isEmpty()) {
            request.setAttribute("errorMessage", "Your shopping cart is empty.");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
            return;
        }
        
        
        Order order = new Order();
        order.setBuyerId(user.getId());
        order.setBuyerAddress(buyerAddress);
        order.setOrderDate(new Date());
        
        // Chuyển đổi danh sách CartDTO sang danh sách OrderItem
        List<OrderItem> orderItems = new ArrayList<>();
        for (CartDTO item : cartList) {
            OrderItem orderItem = new OrderItem();
            orderItem.setProductId(item.getProductId());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setUnitPrice(item.getPrice());
            orderItems.add(orderItem);
        }
        order.setOrderItems(orderItems);
        
       
        OrderDAO orderDAO = new OrderDAO();
        boolean saved = orderDAO.saveOrder(order);
        
        if (saved) {
            request.setAttribute("message", "Order placed successfully! Your order id is " + order.getId());
            request.getRequestDispatcher("orderConfirmation.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Order could not be placed. Please try again.");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
