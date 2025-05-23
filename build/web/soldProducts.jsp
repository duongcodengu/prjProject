<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sold Products</title>
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="/Seller_Header.jsp" />
    <div class="container mt-5">
        <h2>Sold Products</h2>
        <c:choose>
            <c:when test="${empty soldProducts}">
                <div class="alert alert-info">No sold products found.</div>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th>Order ID</th>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Unit Price</th>
                            <th>Order Date</th>
                            <th>Buyer</th>
                            <th>Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${soldProducts}">
                            <tr>
                                <td>${item.orderId}</td>
                                <td>${item.productName}</td>
                                <td>${item.quantity}</td>
                                <td>$<fmt:formatNumber value="${item.unitPrice}" type="number" pattern="#,###.##"/></td>
                                <td><fmt:formatDate value="${item.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${item.buyerName}</td>
                                
                                <td>${item.buyerAddress}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
   
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
