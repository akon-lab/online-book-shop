<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="./style/cart_page.css">
    <link rel="stylesheet" href="./style/main.css">
    <!--JS-->
    <script src="./script/index.js"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>


    <div class="header head-bg px-4 d-flex justify-content-around">
        <h3>Shop Book</h3>

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
                <a href="./option_page.html">  Skin Care  </a>
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

    <div class="sticker mx-auto p-5" title="Click me!" onclick="bill(true)"></div>


    <div class="cart mx-auto border">
    <c:forEach var="book" items="${cart}">
        <div class="book m-2 border">
            <img src="<c:out value="cart.img"/>" class="border" alt="">
            <div class="text-center">
                <p><c:out value="cart.title"/></p>
                <a href="${pageContext.request.contextPath}/book??id=<c:out value="cart.id"/>" style="color: black;">
                    <i class='fas fa-book-reader'></i> go to book page
                </a>
            </div>
        </div>
    </c:forEach>

        <div class="book m-2 border">
            <img src="./img/giirl book2.jpg" class="border" alt="">
            <div class="text-center">
                <p>some text</p>
            </div>
        </div>
        <div class="book m-2 border">
            <img src="./img/giirl book2.jpg" class="border" alt="">
            <div class="text-center">
                <p>some text</p>
            </div>
        </div>
        <div class="book m-2 border">
            <img src="./img/giirl book2.jpg" class="border" alt="">
            <div class="text-center">
                <p>some text</p>
            </div>
        </div>
        <div class="book m-2 border">
            <img src="./img/giirl book2.jpg" class="border" alt="">
            <div class="text-center">
                <p>some text</p>
            </div>
        </div>
        <div class="book m-2 border">
            <img src="./img/giirl book2.jpg" class="border" alt="">
            <div class="text-center">
                <p>some text</p>
            </div>
        </div>

    </div>



    <div id="fade">
        <div class="bill my-5 mx-auto window" id="bill">
            <h1 class="text-center GG-font">Bill</h1>
            <div class="row">
                <div class="col m-2">
                    <strong class="Oswald-font">Count:</strong> num<br>
                    <strong class="Oswald-font">Total Price:</strong> num $ <br>
                    <strong class="Oswald-font">Date:</strong> date
                </div>
                <div class="col m-2">
                    <ul>
                        <li>
                            <strong>Book Title</strong>
                            <p class="Oswald-font">Prices: num $</p>
                        </li>
                        <li>
                            <strong>Book Title</strong>
                            <p class="Oswald-font">Prices: num $</p>
                        </li>
                        <li>
                            <strong>Book Title</strong>
                            <p class="Oswald-font">Prices: num $</p>
                        </li>
                        <li>
                            <strong>Book Title</strong>
                            <p class="Oswald-font">Prices: num $</p>
                        </li>
                    </ul>
                </div>
            </div>

            <h5 class="text-center GG-font">On name Akniet Adil
                <a href="#" class="bl-icon-link" onclick="bill(false)">
                    <i class='fas fa-money-check'></i>
                </a>
            </h5>
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>