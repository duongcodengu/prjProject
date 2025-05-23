<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Manager</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="Seller_Header.jsp" />

    <div class="container mt-5">
        <h2>Product Manager</h2>
        
        
        <div class="mb-3">
            <a href="CreateProductServlet" class="btn btn-success">Create Product</a>
        </div>
        <!-- Bảng danh sách sản phẩm -->
        <table class="table table-bordered table-hover">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty products}">
                    <tr>
                        <td colspan="7" class="text-center">No products found.</td>
                    </tr>
                </c:if>
                <c:forEach var="prod" items="${products}">
                    <tr>
                        <td>${prod.id}</td>
                        <td>${prod.name}</td>
                        <td>${prod.price}$</td>
                        <td>${prod.title}</td>
                        <td>${prod.description}</td>
                        <td>${prod.category.name}</td>
                        <td>
                            
                            <a href="UpdateProductServlet?id=${prod.id}" class="btn btn-primary btn-sm">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
