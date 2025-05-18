<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
 
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="Header.jsp" />

    <div class="container mt-5">
        <h2>Checkout</h2>
        
        
        <c:if test="${not empty message}">
            <div class="alert alert-success" role="alert">
                ${message}
            </div>
        </c:if>
        
     
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>
        
        <div class="row">
            
            <div class="col-md-6">
                <h4>Shipping Details</h4>
                <form action="checkout" method="post">
                    <div class="form-group">
                        <label for="buyerAddress">Shipping Address:</label>
                        <input type="text" class="form-control" id="buyerAddress" name="buyerAddress" placeholder="Enter your shipping address" required>
                    </div>
                    <button type="submit" class="btn btn-success mt-3">Place Order</button>
                </form>
            </div>
            
            
            <div class="col-md-6">
                <h4>Order Summary</h4>
                <c:choose>
                    <c:when test="${empty cart}">
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
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="total" value="0" />
                                <c:forEach items="${cart}" var="product">
                                    <c:set var="subtotal" value="${product.price * product.quantity}" />
                                    <tr>
                                        <td>${product.productName}</td>
                                        <td><fmt:formatNumber value="${product.price}" type="number" pattern="#,###.##"/>$</td>
                                        <td>${product.quantity}</td>
                                        <td><fmt:formatNumber value="${subtotal}" type="number" pattern="#,###.##"/>$</td>
                                    </tr>
                                    <c:set var="total" value="${total + subtotal}" />
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="row mt-4">
                            <div class="col-md-6 offset-md-6 text-right">
                                <h4>Total Price: <strong><fmt:formatNumber value="${total}" type="number" pattern="#,###.##"/></strong>$</h4>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
