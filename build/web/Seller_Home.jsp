
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>eBay Home</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <link rel="icon" href="https://pages.ebay.com/favicon.ico">
        <style>
            .category-img {
                width: 190px;
                height: 190px;
                object-fit: cover;
                border-radius: 50%;
            }
            
            .product-card {
                transition: transform 0.3s ease;
                margin-bottom: 30px;
            }
            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            }
            .product-card img {
                height: 220px;
                object-fit: cover;
            }
            .card-title {
                font-size: 1.2rem;
                font-weight: bold;
            }
            .card-text {
                font-size: 0.95rem;
            }
            .price {
                color: red;
                font-size: 1.1rem;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Seller_Header.jsp" />
     
        <div class="container-fluid mt-5">
            <!-- Carousel -->
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://thekinguin.com/cdn/shop/files/ROW-19392_Fallback_Electronics_770x270_6eed09b8-64bf-4b41-9195-958cf4829405.png?v=1677417008&width=2000" class="d-block w-100" alt="Electronics">
                    </div>
                    <div class="carousel-item">
                        <img src="https://thekinguin.com/cdn/shop/files/ROW-19396_Fallback_Sports_and_Leisure_770x270_45afa227-b743-4a82-86c5-31ab76f0ecbd.png?v=1677417303&width=2000" class="d-block w-100" alt="Sports and Leisure">
                    </div>
                    <div class="carousel-item">
                        <img src="https://ir.ebaystatic.com/cr/v/c1/IE---19394_FlyoutFallback_Home_Garden_770x270_IE.png" class="d-block w-100" alt="Home & Garden">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            
            
            <div class="mt-5">
                <c:choose>
                    <c:when test="${not empty query}">
                        <h2 class="mb-4" style="color: orange">Kết quả tìm kiếm cho: ${query}</h2>
                        <div class="row">
                            <c:forEach items="${pquery}" var="q">
                                <div class="col-md-3">
                                    <div class="card product-card">
                                        <img src="${q.img_url}" class="card-img-top" alt="${q.name}">
                                        <div class="card-body">
                                            <a href="p_detail?id=${q.id}" class="text-dark"><h3 class="card-title">${q.name}</h3></a>
                                            <p class="card-text">${q.description}</p>
                                            <h4 class="price">${q.price}$</h4>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h2 class="mb-4" style="color: orange">Top hot product</h2>
                        <div class="row">
                            <c:forEach items="${products}" var="p">
                                <div class="col-md-3">
                                    <div class="card product-card">
                                        <img src="${p.img_url}" class="card-img-top" alt="${p.name}">
                                        <div class="card-body">
                                            <a href="p_detail?id=${p.id}" class="text-dark"><h3 class="card-title">${p.name}</h3></a>
                                            <p class="card-text">${p.description}</p>
                                            <h4 class="price">${p.price}$</h4>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            
         
            <h2 class="mt-5" style="color: hotpink">Type Categories</h2>
            <div class="row mt-4">
                <div class="col-sm-3">
                    <div class="card border-0 text-center">
                        <img src="https://toplist.vn/images/800px/do-cong-nghe-do-dien-tu-527119.jpg" class="category-img mx-auto" alt="Electronic">
                        <div class="card-body">
                            <a href="#"><p class="card-text">Electronic</p></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card border-0 text-center">
                        <img src="https://th.bing.com/th/id/OIP.3cD6lnxemUlqOgiBRuueoAHaHa?rs=1&pid=ImgDetMain" class="category-img mx-auto" alt="Clothing">
                        <div class="card-body">
                            <a href="#"><p class="card-text">Clothing</p></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card border-0 text-center">
                        <img src="https://d1y0acf6fr5315.cloudfront.net/wp-content/uploads/sites/53/2018/05/home-appliances-1.jpg" class="category-img mx-auto" alt="Home Appliances">
                        <div class="card-body">
                            <a href="#"><p class="card-text">Home Appliances</p></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card border-0 text-center">
                        <img src="https://ir.ebaystatic.com/cr/v/c01/ECM_PopularDestination_Reburbished.jpg" class="category-img mx-auto" alt="Secondhand">
                        <div class="card-body">
                            <a href="#"><p class="card-text">Secondhand</p></a>   
                        </div>
                    </div>
                </div>
            </div>

          
            <footer class="bg-light text-center text-lg-start mt-5">
                <div class="container p-4">
                    <div class="row">
                        <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
                            <h5 class="text-uppercase">About</h5>
                            <p>Information about the company.</p>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">Links</h5>
                            <ul class="list-unstyled mb-0">
                                <li><a href="#!" class="text-dark">Privacy Policy</a></li>
                                <li><a href="#!" class="text-dark">Terms of Service</a></li>
                                <li><a href="#!" class="text-dark">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
