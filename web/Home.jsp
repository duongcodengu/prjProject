

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page errorPage="Erro.jsp" %>
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
            .card-img-top {
                height: 200px;
                object-fit: cover;
            }
            .card {
                display: flex;
                flex-direction: column;
                height: 100%;
            }
            .card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }
        </style>
    </head>
    <body>

        <jsp:include page="Header.jsp" />
       

        <!-- Main Content -->
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
                        <img src="https://thekinguin.com/cdn/shop/files/ROW-19392_Fallback_Electronics_770x270_6eed09b8-64bf-4b41-9195-958cf4829405.png?v=1677417008&width=2000" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://thekinguin.com/cdn/shop/files/ROW-19396_Fallback_Sports_and_Leisure_770x270_45afa227-b743-4a82-86c5-31ab76f0ecbd.png?v=1677417303&width=2000" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://ir.ebaystatic.com/cr/v/c1/IE---19394_FlyoutFallback_Home_Garden_770x270_IE.png" class="d-block w-100" alt="...">
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

            <h2 class="mt-5" style="color: orange">Top hot product</h2>
            <div class="row">   
                <c:choose>
                    <c:when test="${not empty query}">
                        <h2 class="mt-5" style="color: orange">Kết quả tìm kiếm cho: ${query}</h2>
                        <c:forEach items="${pquery}" var="q" >
                            <div class="card">
                                <div class="card img">
                                    <div class="card shadow-sm">
                                        <img class="card-body" src="${q.img_url}" />
                                        <a href="p_detail?id=${q.id}"><h3>${q.name}</h3></a>
                                                <%
                                                    int result = 5 / 0; // Gây lỗi chia cho 0
                                                %>
                                        <p>${q.description}</p>
                                        <h4 style="color: red" >${q.price}$</h3>       
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${products}" var="p" varStatus="status">
                            <div class="card">
                                <div class="card img">
                                    <div class="card shadow-sm">
                                        <img class="card-body" src="${p.img_url}" />
                                        <a href="p_detail?id=${p.id}"><h3>${p.name}</h3></a>
                                        <p>${p.description}</p>
                                        <h4 style="color: red" >${p.price}$</h3>       
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>

                </c:choose>

            </div>

            <h2 style="color: hotpink">Type Categories</h2>
            <div class="row mt-4">
                <div class="col p-0">
                    <div class="card border-0">
                        <img src="https://toplist.vn/images/800px/do-cong-nghe-do-dien-tu-527119.jpg" href="" class="category-img mx-auto" alt="Electronic" >
                        <div class="card-body">
                            <!--                             note tạo trang luxury-->
                            <a href="#"><p class="card-text text-center">Electronic</p></a>
                        </div>
                    </div>
                </div>
                <div class="col p-0">
                    <div class="card border-0">
                        <img src="https://th.bing.com/th/id/R.614d75fcc4473508935cb94d201a21c0?rik=EMxrRuTUwuea4Q&riu=http%3a%2f%2flavenderstudio.com.vn%2fwp-content%2fuploads%2f2021%2f06%2fcach-chup-hinh-san-pham-quan-ao-dep-2.png&ehk=%2fMC%2fMXWu5mCfg7TpcMDPVUd2MGzOa44whElVoXWkrp8%3d&risl=&pid=ImgRaw&r=0" class="category-img mx-auto" alt="Clothing">
                        <div class="card-body">
                            <!--  note tạo trang giày-->
                            <a href="#"> <p class="card-text text-center">Clothing</p></a>
                        </div>
                    </div>
                </div>
                <div class="col p-0">
                    <div class="card border-0">
                        <img src="https://d1y0acf6fr5315.cloudfront.net/wp-content/uploads/sites/53/2018/05/home-appliances-1.jpg" class="category-img mx-auto" alt="P&A">
                        <div class="card-body">

                            <a href="#"> <p class="card-text text-center">Home Appliances</p></a>
                        </div>
                    </div>
                </div>
                <div class="col p-0">
                    <div class="card border-0">
                        <img src="https://ir.ebaystatic.com/cr/v/c01/ECM_PopularDestination_Reburbished.jpg" class="category-img mx-auto" alt="Refurbished">
                        <div class="card-body">
                            <a href="#"> <p class="card-text text-center">Secondhand</p></a>   
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

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>