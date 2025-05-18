package Controller;

import Dao.SellerDAO;
import Model.Product;
import Model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "ProductManagerServlet", urlPatterns = {"/ProductManagerServlet"})
public class ProductManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LogUser");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        
        
        SellerDAO sellerDao = new SellerDAO();
        List<Product> products = sellerDao.getProductsBySellerId(user.getId());
        
        
        request.setAttribute("products", products);
        request.getRequestDispatcher("productManager.jsp").forward(request, response);
    }
}
