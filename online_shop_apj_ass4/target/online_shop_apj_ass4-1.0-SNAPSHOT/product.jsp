<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!--
             <meta http-equiv="Refresh" content="55" />

-->

    <!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!--fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Grenze+Gotisch&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
    <!--CSS-->
    <link rel="stylesheet" href="./style/product_page.css">
    <link rel="stylesheet" href="./style/main.css">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<!--intro-->
<div class="header head-bg px-4 d-flex justify-content-around">
    <h3>Shop Book</h3>

    <div class="row my-2 d-flex justify-content-around">
        <div>
            <i class='fas fa-book-open' onclick="openNav()"></i>
        </div>

        <a href="${pageContext.request.contextPath}/cart" style="color: white;">
            <i class='fas fa-shopping-basket'></i>
        </a>
        <a href="./log.jsp" style="color: white;">
            <i class='fas fa-user-circle'></i>
        </a>
    </div>

</div>

<div class="nav" id="Navka">

    <a href="#" onclick="closeNav()">&times;</a>

    <ul>
        <li>
            <div class="mob">
                <form action="" method="GET" class="row d-flex justify-content-center">
                    <input type="search" name="" id="">
                    <button type="submit" class="p-1">&#8981;</button>
                </form>
            </div>
        </li>
        <li>
            <a href="./option_page.html"> Skin Care </a>
        </li>

        <li>
            <a href="./option_page.html">Makeup</a>
        </li>

        <li>
            <a href="./option_page.html">Lipstics</a>
        </li>

        <li>
            <a href="./option_page.html">Eye Shadows</a>
        </li>

        <li>
            <a href="./option_page.html">Eyeliners</a>
        </li>

        <li>
            <a href="./option_page.html">Foundation</a>
        </li>

        <li>
            <a href="./option_page.html">Blushers</a>
        </li>

    </ul>

</div>

<div class="main mx-auto m border">

    <h1 class="text-center GG-font">
        ${bookItem.title}
        <c:out  value="${bookItem.title}"/>
    </h1>

    <div class="book mx-auto">
        <div class="col">
            <img src="<c:out value="${bookItem.img}"/>" class="border" alt="">
        </div>
        <div class="col">

            <h5 class="Oswald-font">Genre:</h5>
            <ul>

                <c:forEach var="genre" items="${bookGenre}">
                    <li><c:out value="genre.name"/></li>
                </c:forEach>

            </ul>
            <h5 class="Oswald-font">Description:</h5>
            <p><c:out value="${bookItem.desc}"/></p>
            <strong class="Oswald-font">Price:</strong>
            <c:out value="${bookItem.price}"/> $
            <a href="${pageContext.request.contextPath}/cart?action=add&id=<c:out value="${bookItem.id}"/>">
                <i class='fas fa-shopping-cart' class="btn btn-pr" title="Add me to cart!"></i>
            </a>

        </div>
    </div>

</div>


<h2 class="text-center Oswald-font">Recommended For You</h2>
<div id="carouselExampleControls" class="py-3 mx-auto carousel slide" data-ride="carousel">

    <div class="carousel-inner">

        <c:forEach var="book" items="${bookRecomendList}" varStatus="loopCounter">

            <c:if test="${loopCounter.begin}">
                <div class="carousel-item active">
                <div class="d-flex justify-content-around">
            </c:if>

            <c:if test="${(loopCounter.count+1)%3==0 && loopCounter.count!=0&&loopCounter.count!=8}">
                </div>
                </div>
                <div class="carousel-item">
                <div class="d-flex justify-content-around">
            </c:if>

            <a class="hov-card " href="${pageContext.request.contextPath}/book?id=<c:out value="book.id"/>">
                <img src="<c:out value="book.img"/>" alt="...">

                <div class="hov-text">
                    <p class="subTitle">
                        <c:out value="book.title"/>
                    </p>
                </div>
            </a>

            <c:if test="${loopCounter.count==8}">
                </div>
                </div>
            </c:if>

        </c:forEach>


    </div>

    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>

</div>


<!--footer-->
<div class="footer my-10 p-5 d-flex justify-content-center">
    <h1 class="my-auto p-5">Logo</h1>
    <div class="col p-5">
        <h4>
            Website was made: <br> in Akon Lab <br> by Akniet Adil <br>
        </h4>
    </div>
</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>