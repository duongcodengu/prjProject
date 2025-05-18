<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Create Product</title>
 
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="Seller_Header.jsp" />

        <div class="container mt-5">
            <a href="ProductManagerServlet" class="btn btn-primary">back to list</a>
            <h2>Create Product</h2>
         
            <c:if test="${not empty message}">
                <div class="alert alert-success">${message}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>
            <form action="CreateProductServlet" method="post">
                <div class="form-group">
                    <label for="name">Product Name:</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter product name" required>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" step="0.01" class="form-control" id="price" name="price" placeholder="Enter price" required>
                </div>
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="Enter title">
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" placeholder="Enter description"></textarea>
                </div>
                <div class="form-group">
                    <label for="img_url">Image URL:</label>
                    <input type="text" class="form-control" id="img_url" name="img_url" placeholder="Enter image URL">
                </div>
                <div class="form-group">
                    <select name="category_id" class="form-control" required>
                        <option value="">--Select Category--</option>
                        <c:forEach var="cat" items="${categories}">
                            <option value="${cat.id}">${cat.name}</option>
                        </c:forEach>
                    </select>

                </div>
                <button type="submit" class="btn btn-primary mt-3">Create Product</button>
            </form>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
