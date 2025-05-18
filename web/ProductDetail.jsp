

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>eBay Home</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <link rel="icon" href="https://pages.ebay.com/favicon.ico">
 <style>
        .product-container {
            max-width: 1100px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .product-img {
            width: 100%;
            height: auto; 
            border-radius: 10px;
        }
        .product-title {
            font-size: 24px;
             font-size: 28px; 
            margin-bottom: 10px;
        }
        .product-price {
            font-size: 22px;
            color: #e74c3c;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .product-description {
             font-size: 18px; 
            color: #555;
            margin-bottom: 15px;
        }
        .btn-buy {
            background-color: #e74c3c;
            color: white;
            font-size: 18px;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: bold;
        }
        .btn-buy:hover {
            background-color: #c0392b;
        }
    </style>

    </head>
    <jsp:include page="Header.jsp"/>
   <body class="bg-light">
    <div class="container">
        <div class="product-container row">
            <div class="col-md-5">
                <img src="${product.img_url}" alt="Ảnh sản phẩm" class="product-img">
            </div>
            <div class="col-md-7">
                <h1 class="product-title">${product.name}</h1>
                <p class="product-price"><i class="bi bi-currency-dollar"></i> ${product.price} </p>
                <p class="product-description">${product.description}</p>
                 <p class="product-description">${product.title}</p>
                 <a href="add_to_card?id=${product.id}"><button class="btn btn-buy btn-block"><i class="bi bi-cart-plus"> Thêm vào giỏ hàng</button></a></i>
        </div>
    </div>
                
</body>
</html>
