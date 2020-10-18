<%@ page import="controller.BookController" %>
<%@ page import="controller.GenreController" %>
<%@ page import="items.GenreItem" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="javax.swing.text.html.HTMLDocument" %>
<%@ page import="items.BookItem" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!--fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Grenze+Gotisch&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
    <!--CSS-->
    <link rel="stylesheet" href="./style/index.css">
    <link rel="stylesheet" href="./style/main.css">
    <!--JS-->
    <script src="./script/index.js"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<%!
    BookController bookController = new BookController();
    GenreController genreController = new GenreController();
    LinkedList<BookItem> b_list=bookController.getAll();
    LinkedList<GenreItem> g_list=genreController.allGenre();
%>
<!--intro-->
<div class="intro">

    <div class="header px-4 d-flex justify-content-around">
        <h3 class="GG-font">Shop Book</h3>

        <div class="row my-2 d-flex justify-content-around">
            <div>
                <i class='fas fa-book-open' onclick="openNav()"></i>
            </div>
            <a href="./cart.jsp" style="color: white;">
                <i class='fas fa-shopping-basket'></i>
            </a>
            <a href="./log.jsp" style="color: white;">
                <i class='fas fa-user-circle'></i>
            </a>
        </div>
    </div>

    <div class="row d-flex justify-content-around py-5">
        <div class="text p-5 text-center w-glow position-static">
            <h1 class="GG-font" style="font-size: 6vh;">Book website</h1>
            <h4>some text bla-bla</h4>
        </div>
        <div class="search text-center py-5">
            <h3 class="w-glow Oswald-font">Search story</h3>
            <form class="pt-3 pb-5 d-flex justify-content-center" action="" method="POST">
                <input type="text" class="pl-2">
                <button type="submit" class="pl-1 btn btn-outline-warning"><i class="material-icons my-auto">search</i>
                </button>
            </form>
        </div>
    </div>


</div>

<!--nav-->
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

        <%for (GenreItem item : g_list) {%>
        <li>
            <a href="${pageContext.request.contextPath}/genre?id=<%=item.getId()%>">
                <%=item.getName()%>
            </a>
        </li>
        <%}%>

    </ul>

</div>


<!--first-->
<div class="first m">
    <h1 class="Oswald-font">Gener which we have here</h1>

    <div class="row d-flex justify-content-center">
        <%for (int i = 0; i < 3; i++) { %>
        <a href="${pageContext.request.contextPath}/genre?id=<%=g_list.get(i).getId()%>" class="card hov-card col"
           style="background-image: url(<%=g_list.get(i).getImage()%>);">
            <div class="text hov-text">
                <h4 class="subTitle">-<%=g_list.get(i).getName()%>
                </h4>
            </div>
        </a>
        <%}%>
    </div>
    <div class="row d-flex justify-content-center">
        <%for (int i = 3; i < 5; i++) { %>
        <a href="${pageContext.request.contextPath}/genre?id=<%=g_list.get(i).getId()%>" class="card hov-card col"
           style="background-image: url(<%=g_list.get(i).getImage()%>);">
            <div class="text hov-text">
                <h4 class="subTitle">-<%=g_list.get(i).getName()%>
                </h4>
            </div>
        </a>
        <%}%>
    </div>

</div>

<!--second-->
<div class="second m">

    <div class="row">
        <div class="col-lg-8 p-lg-5 col-6 p-2">
            <div class="text">
                <h2 class=" Oswald-font">
                    Deciding what to read next?
                </h2>
                <p>You’re in the right place. Tell us what titles or genres you’ve enjoyed in the past, and we’ll give
                    you surprisingly insightful recommendations.</p>
                <a href="">go with link</a>
            </div>
        </div>
        <div class="col-lg-4 col-6">
            <img src="./img/giirl book3.jpg" style="width: 100%;" alt="">
        </div>
    </div>

    <div class="row">

        <div class="col-lg-4 col-6">
            <img src="./img/book_coffee.jpg" style="width: 100%;" alt="">
        </div>
        <div class="col-lg-8 col-6 p-lg-5 p-2">
            <div class="text">
                <h2 class=" Oswald-font">What are your friends reading?
                </h2>
                <p>Chances are your friends are discussing their favorite (and least favorite) books on Goodreads.</p>
                <a href="">go with link</a>
            </div>
        </div>
    </div>

</div>

<!--third-->
<div class="">
    <h3 class="text-center Oswald-font">Today top 6 story</h3>
    <div class="third mx-auto d-flex justify-content-center">

        <%
            for (int i = 0; i < 6; i++) {
        %>
        <div class="card m-2">
            <img src="<%= b_list.get(i).getImg()%>" alt="">
            <div class="text p-3">
                <h5><%= b_list.get(i).getTitle()%>
                </h5>

                <a href="${pageContext.request.contextPath}/book?id=<%=b_list.get(i).getId()%>">Read</a>
            </div>
        </div>
        <%}%>

    </div>

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