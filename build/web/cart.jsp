

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="Header.jsp" />

<div class="container mt-5">
    <h2>Shopping Cart</h2>

    <c:choose>
    <c:when test="${empty listDto}">
        <p class="alert alert-warning">Your shopping cart is empty!</p>
    </c:when>
    <c:otherwise>
            <table class="table table-bordered table-hover mt-3">
                <thead class="thead-light">
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listDto}" var="product">
                    <tr>
                        <td>${product.productName}</td>
                        <td>${product.price}</td>
                        <td>
                            <div class="input-group">
                                <a href="updateQuantity?productId=${product.productId}&quantity=${product.quantity}&action=dec" class="btn btn-outline-secondary">-</a>
                                <div class="form-control text-center"> ${product.quantity}</div>
                                <a href="updateQuantity?productId=${product.productId}&quantity=${product.quantity}&action=inc" class="btn btn-outline-secondary">+</a>
                            </div>
                        </td>
                       <td><fmt:formatNumber value="${product.total}" type="number" pattern="#,###.#"/>$</td>
                        <td>
                            <a href="remove?productId=${product.productId}" class="btn btn-danger btn-sm">Remove</a>
                        </td>
                        </tr>
                        </c:forEach>
                </tbody>
            </table>

          
            <div class="row mt-4">
                <div class="col-md-6 offset-md-6">
                    <h4>Total Price: <span id="total-price"></span></h4>
                    <a href="checkout" class="btn btn-success btn-block mt-3">Proceed to Checkout</a>
                </div>
            </div>
      
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</c:otherwise>
</c:choose>
</html>