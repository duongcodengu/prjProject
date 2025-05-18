/*
 * Click nbfs:
 * Click nbfs:
 */
package Controller;

import Dao.ProductDao;
import Dao.SellerDAO;
import Model.Category;
import Model.Product;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CreateProductServlet", urlPatterns = {"/CreateProductServlet"})
public class CreateProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet CreateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDao dao = new ProductDao();
        List<Category> categories = dao.getAllCategory();
        
        
        request.setAttribute("categories", categories);
        
        
        request.getRequestDispatcher("createProduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LogUser");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String img_url = request.getParameter("img_url");
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        int seller_id = user.getId(); 

        
        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setTitle(title);
        product.setDescription(description);
        product.setImg_url(img_url);
        product.setCategory_id(category_id);
        product.setSeller_id(seller_id);

        
        SellerDAO dao = new SellerDAO();
        boolean success = dao.createProduct(product);

        if (success) {
            request.setAttribute("message", "Product created successfully with id: " + product.getId());
        } else {
            request.setAttribute("errorMessage", "Failed to create product. Please try again.");
        }
        request.getRequestDispatcher("createProduct.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
