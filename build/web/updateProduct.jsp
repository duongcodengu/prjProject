<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="Header.jsp" />
    
    <div class="container mt-5">
        <h2>Update Product</h2>
        <!-- Hiển thị thông báo thành công hoặc lỗi -->
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        <a href="ProductManagerServlet" class="btn btn-primary">back to list</a>
        <!-- Nếu sản phẩm tồn tại, hiển thị form cập nhật -->
        <c:if test="${not empty product}">
            <form action="UpdateProductServlet" method="post">
                <input type="hidden" name="id" value="${product.id}" />
                <div class="form-group">
                    <label for="name">Product Name:</label>
                    <input type="text" class="form-control" name="name" value="${product.name}" required>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" step="0.01" class="form-control" name="price" value="${product.price}" required>
                </div>
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" class="form-control" name="title" value="${product.title}">
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" name="description">${product.description}</textarea>
                </div>
                <div class="form-group">
                    <label for="img_url">Image URL:</label>
                    <input type="text" class="form-control" name="img_url" value="${product.img_url}">
                </div>
                <div class="form-group">
                    <label for="category_id">Category:</label>
                    <select name="category_id" class="form-control" required>
                        <option value="">--Select Category--</option>
                        <c:forEach var="cat" items="${categories}">
                            <option value="${cat.id}" ${cat.id == product.category_id ? 'selected' : ''}>${cat.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <!-- seller_id không cần hiển thị, được xác định bởi người dùng trong session -->
                <button type="submit" class="btn btn-primary mt-3">Update Product</button>
            </form>
        </c:if>
        <c:if test="${empty product}">
            <div class="alert alert-warning">Product not found.</div>
        </c:if>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
