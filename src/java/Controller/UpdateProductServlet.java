package Controller;

import Dao.ProductDao;
import Dao.SellerDAO;
import Model.Category;
import Model.Product;
import Model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProductServlet"})
public class UpdateProductServlet extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("LogUser");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("productList.jsp");
            return;
        }
        int id = Integer.parseInt(idStr);
        
        
        SellerDAO sellerDao = new SellerDAO();
        Product product = sellerDao.getProductById(id);
        
        
        ProductDao productDao = new ProductDao();
        List<Category> categories = productDao.getAllCategory();
        
        request.setAttribute("product", product);
        request.setAttribute("categories", categories);
        
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
         User user = (User) session.getAttribute("LogUser");
         if (user == null) {
             response.sendRedirect("login");
             return;
         }
         
         int id = Integer.parseInt(request.getParameter("id"));
         String name = request.getParameter("name");
         double price = Double.parseDouble(request.getParameter("price"));
         String title = request.getParameter("title");
         String description = request.getParameter("description");
         String img_url = request.getParameter("img_url");
         int category_id = Integer.parseInt(request.getParameter("category_id"));
         int seller_id = user.getId(); 
         
         
         Product product = new Product();
         product.setId(id);
         product.setName(name);
         product.setPrice(price);
         product.setTitle(title);
         product.setDescription(description);
         product.setImg_url(img_url);
         product.setCategory_id(category_id);
         product.setSeller_id(seller_id);
         
         
         SellerDAO sellerDao = new SellerDAO();
         boolean success = sellerDao.updateProduct(product);
         
         if (success) {
             request.setAttribute("message", "Product updated successfully.");
         } else {
             request.setAttribute("errorMessage", "Failed to update product. Please try again.");
         }
         
         Product updatedProduct = sellerDao.getProductById(id);
         ProductDao productDao = new ProductDao();
         List<Category> categories = productDao.getAllCategory();
         
         request.setAttribute("product", updatedProduct);
         request.setAttribute("categories", categories);
         
         request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
    }
}
