

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!-- Header -->
<header class="bg-light py-2">
    <div class="container-fluid d-flex justify-content-between">
        <div>
        <a href="#" class="mx-2 dropdown-toggle" data-bs-toggle="dropdown"
           aria-expanded="false">Watchlist</a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">View all</a></li>
            <li><a class="dropdown-item" href="#">Saved items</a></li>
        </ul>
  
            <a href="#" class="mx-2">For Seller</a>
            <a href="#" class="mx-3">Help & Contact</a>
        </div>
        <div>


            <a href="#" class="mx-2 dropdown-toggle" data-bs-toggle="dropdown"
               aria-expanded="false">My eBay</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Summary</a></li>
                <li><a class="dropdown-item" href="#">Purchase History</a></li>
                <li><a class="dropdown-item" href="#">Messages</a></li>
            </ul>
            <c:if test="${sessionScope.LogUser == null}">
                <a href="login" class="mx-3">Hi! Sign in or register</a>
            </c:if>
            <c:if test="${sessionScope.LogUser != null}">
                <a href="logout" class="mx-3">Logout</a>
            </c:if>
            <a href="#" class="mx-2">
                <i class="bi bi-bell"></i> <!-- Icon chuông -->
            </a>


        </div>
    </div>
</header>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light py-3">

        <div class="container-fluid">
            <a href="home" class="mx-3"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTM0IiBoZWlnaHQ9IjU0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnN2Zz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPg0KIDxnPg0KICAgPHBhdGggZD0ibTI2LjkxLDI1LjE1Yy0wLjI2LC02IC01LC04LjYgLTkuNiwtOC42Yy01LDAgLTkuMywyLjYgLTEwLDguNmwyMCwwbDAsMGwwLDBsLTAuNCwwem0tMjAsNC40YzAuNCw2IDQuNSwxMCAxMC40LDkuN2M0LDAgNy41LC0xLjYgOC43LC01LjJsNywwYy0xLjMsNy4yIC04LjksOS42IC0xNS41LDkuNmMtMTIsMCAtMTcuMiwtNi42IC0xNy4yLC0xNS40YzAsLTkuNyA1LjUsLTE2IDE3LjMsLTE2YzkuNCwwIDE2LjMsNSAxNi4zLDE1LjdsMCwxLjhsLTI3LDBsMCwwIiBmaWxsPSIjRTQzMTM3IiAvPg0KICAgPHBhdGggZD0ibTUxLDM5LjA1YzYsMCAxMC40LC00LjUgMTAuNCwtMTEuMmMwLC02LjcgLTQuMiwtMTEgLTEwLjQsLTExLjJjLTYsMCAtMTEsNC41IC0xMC41LDExLjJjMCw3IDQsMTEgMTEsMTEuMmwtMC41LDB6bS0xNywtMzguN2w2LjcsMGwwLDE2LjhjMywtNCA4LC01IDEyLjIsLTVjNywwIDE2LDUgMTUuNywxNS45YzAsOSAtNi42LDE1LjcgLTE1LjgsMTUuN2MtNSwwIC05LC0yIC0xMi4yLC01LjJjMCwxLjQgLTAuMSwyLjggLTAuMiw0bC02LjYsMCIgZmlsbD0iIzAwNjNEMSIgLz4NCiAgIDxwYXRoIGQ9Im04NC41LDI4Ljc1Yy02LDAgLTEwLDEgLTkuOCw1LjNjMCwzIDIsNSA3LjMsNS40YzcsMCAxMSwtNCAxMSwtMTBsMCwtMC43Yy0yLDAgMCwwIC04LDBsLTAuNSwwem0xNSw4LjNjMCwwIDAsNCAwLjIsNS42bC02LjIsMGMwLDAgMCwwIC0wLjIsLTQuMmMtMyw0IC03LDUgLTEzLDUuM2MtOCwwIC0xMywtNCAtMTIuNiwtOS40YzAsLTcgNiwtMTAgMTYuNCwtMTBjMywwIDAsMCA4LjcsMGwwLC0xYzAsLTUgLTMsLTcgLTguNSwtNi44Yy00LDAgLTcsMiAtNy4zLDQuNWwtNywwYzEsLTcgOCwtOSAxNSwtOWM4LDAgMTUsMyAxNC42LDExIiBmaWxsPSIjRjRBRTAxIiAvPg0KICAgPHBhdGggZD0ibTEzMy41LDEzLjI1bC0yMC42LDQwLjVsLTcuNSwwbDYsLTExLjNsLTE1LjUsLTI5LjNsNy44LDBsMTEuNCwyM2wxMS40LC0yMyIgZmlsbD0iIzg1QjcxNiIgLz4NCiA8L2c+DQo8L3N2Zz4="
                                             alt="eBay Logo" style="width: 100px;"></a>
            <div class="d-flex w-100">
                <form action="search" method="post" class="d-flex w-100">
                    <input class="form-control" type="search" name="query"
                           placeholder="Search for anything" aria-label="Search">
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>         
                <a href="cart" class="mx-2">
                    <i class="bi bi-cart"></i> <!-- Icon gio hàng -->
            </div>
        </div>
    </nav>



    <div class="bg-light py-2">
        <div class="container d-flex justify-content-between">
            <a href="#" class="text-dark">Explore (New!)</a>
            <a href="#" class="text-dark">Saved</a>
            <a href="#" class="text-dark">Electronics</a>
            <a href="#" class="text-dark">Motors</a>
            <a href="#" class="text-dark">Fashion</a>
            <a href="#" class="text-dark">Collectibles and Art</a>
            <a href="#" class="text-dark">Sports</a>
            <a href="#" class="text-dark">Health & Beauty</a>
            <a href="#" class="text-dark">Industrial equipment</a>
            <a href="#" class="text-dark">More</a>
        </div>
    </div>
</body>