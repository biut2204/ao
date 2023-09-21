<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hàng shoppe</title>
    <!--styles-->
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <style>
        body {
            background-color: white;

        }

        * {
            margin: 0px;
            padding: 0px;
            font-family: Arial, Helvetica, sans-serif;
        }

        /*thanh danh mục*/
        .nav {
            position: fixed;
            z-index: 90;
            background-color: black;
            display: flex;
            width: 100%;
            height: 4em;
            line-height: 4em;
            justify-content: space-between;
        }

        .logo {
            font-size: 5px;
            padding-left: 2em;
            margin: 5px;
            height: 50px;
        }

        .menu {
            display: flex;
        }

        .menu li {
            padding-right: 8em;
            font-size: 17px;
            left: 10px;
            margin: 0 2px;
            float: center;
            letter-spacing: 3px;
        }

        .menu li a {
            color: white;
            text-decoration: none;
            list-style-type: none;
        }

        .menu li a:hover {
            color: #e32879;
            transition: color .2s ease-out;
        }

        /*1*/
        .menu_dow {
            background-color: black;
            width: 250px;
            height: 3em;
            line-height: 2.4em;
            margin: 0px auto;
            position: absolute;
            top: 64px;
            right: 660px;
            display: none;
            text-decoration: none;
            list-style-type: none;
        }

        .menu_dow li {
            text-align: left;
            padding: 3px;
            padding-left: 1em;
        }

        .menu_dow li a:hover {
            color: #e32879;
        }

        .menu .menu_link:hover .menu_dow {
            display: block;
        }

        /*2*/
        .menu_dow2 {
            background-color: black;
            width: 250px;
            height: 6em;
            line-height: 2.4em;
            margin: 0px auto;
            position: absolute;
            top: 64px;
            right: 950px;
            display: none;
            text-decoration: none;
            list-style-type: none;
        }

        .menu_dow2 li {
            text-align: left;
            padding: 3px;
            padding-left: 1em;
        }

        .menu_dow2 li a:hover {
            color: #e32879;
        }

        .menu .menu_link:hover .menu_dow2 {
            display: block;
        }

        /*3*/
        .menu_dow3 {
            background-color: black;
            width: 250px;
            height: 3em;
            line-height: 2.4em;
            margin: 0px auto;
            position: absolute;
            top: 64px;
            right: 295px;
            display: none;
            text-decoration: none;
            list-style-type: none;
        }

        .menu_dow3 li {
            text-align: left;
            padding: 3px;
            padding-left: 1em;
        }

        .menu_dow3 li a:hover {
            color: #e32879;
        }

        .menu .menu_link:hover .menu_dow3 {
            display: block;
        }

        /*4*/
        .menu_dow4 {
            background-color: black;
            width: 200px;
            height: 8em;
            line-height: 2.4em;
            margin: 0px auto;
            position: absolute;
            top: 64px;
            right: 50px;
            display: none;
            text-decoration: none;
            list-style-type: none;
        }

        .menu_dow4 li {
            text-align: left;
            padding: 3px;
            padding-left: 1em;
        }

        .menu_dow4 li a:hover {
            color: #e32879;
        }

        .menu .menu_link:hover .menu_dow4 {
            display: block;
        }
        button {
            padding: 12px;
            background-color: rgb(48, 47, 47);
            color: white;
            border-radius: 100px;
        }

        button:hover {
            background-color: gray;
        }

        .menu2 {
            position: absolute;
            right: 30px;
        }

        .menu2 a {
            font-size: 25px;
            line-height: 70px;
            margin: 0 7px;
            color: white;
        }

        .menu2 a:hover {
            color: #e32879;
            transition: color .2s ease-out;
        }

        /*5*/
        .menu_dow5 {
            background-color: black;
            width: 250px;
            height: 6em;
            line-height: 2.4em;
            margin: 0px auto;
            position: absolute;
            top: 64px;
            right: 20px;
            display: none;
            text-decoration: none;
            list-style-type: none;
        }

        .menu_dow5 li {
            text-align: left;
            padding: 3px;
            padding-left: 1em;
        }

        .menu_dow5 li a:hover {
            color: #e32879;
        }

        .menu .menu_link:hover .menu_dow5 {
            display: block;
        }

        .menu2 {
            position: absolute;
            right: 30px;
        }

        .menu2 a {
            font-size: 25px;
            line-height: 70px;
            margin: 0 7px;
            color: white;
        }

        .menu2 a:hover {
            color: #e32879;
            transition: color .2s ease-out;
        }


        /*sale*/
        .container {
            max-width: 1500px;
            margin: 10px auto;
        }

        .container .sales-mode {
            display: flex;
            justify-content: space-between;
            font-size: 30px;
            letter-spacing: 5px;
            padding: 50px 10px;
            margin: 8px 0;
        }

        .container .sales-mode .icon a {
            font-size: 50px;
            height: 10px;
            color: black;
            width: 15%;
        }

        .container .sales-mode .icon {
            margin-right: 20px;
            max-height: 10px;
            font-size: 15px;
            margin: 5px 18px;
            width: 100%;
        }

        .container .sales-mode .shipping,
        .container .sales-mode .return,
        .container .sales-mode .warranty {
            display: flex;
            align-items: center;
        }

        .container .categories {
            margin: 52px 80px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            text-decoration: none;
            list-style-type: none;
        }

        .container .category {
            text-align: center;
            letter-spacing: 10px;
            font-size: 25px;
        }

        .gong {
            font-size: 25px;
            letter-spacing: 10px;
            text-align: center;
            padding: 30px;
            display: block;
        }

        /*banner chủ*/
        .banner img {
            width: 100%;
            height: 100% s;
            top: 100px;
        }


        /*sản phẩm giá tên*/
        .column {
            width: 20%;
            float: left;
            flex-wrap: wrap;
            justify-content: space-around;
            padding-bottom: 100px;
        }

        .san-pham {
            border-radius: 5px;
            box-shadow: 0px 0px gray;
            padding: 10px;
            margin: 10px 20px;
            text-emphasis: center;
            background-color: white;
        }

        .san-pham .ten {
            font-family: 'Times New Roman', Times, serif;
            font-size: larger;
            color: black;
            text-align: center;
            font-size: 16PX;
            text-decoration: none;
        }

        .san-pham .ten a {
            text-decoration: none;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 15px;
            color: black;
        }

        .san-pham .ten a:hover {
            color: cornflowerblue;
            transition: color .2s ease-out;
            text-decoration: underline;
        }

        .san-pham img {
            max-width: 95%;
        }

        .san-pham .gia {
            color: red;
            font-weight: bold;
            font-size: larger;
            text-align: center;
        }

        .san-pham .gia del {
            color: gray;
        }

        .san-pham:hover {
            transition: all .3s linear;
            box-shadow: rgb(0 0 0 / 13%) 0px 10px 20px 0px, rgb(0 0 0 / 19%) 0px 3px 9px 0px;
        }


        /* banner dow*/
        .banner_dow {
            width: 20%
            height: 90px;
            text-align: center;
        }

        .banner_dow img {
            width: 300px;
            padding: 50px 50px;
            margin: 10px 0;
        }

        /* banner dưới */
        .banner_dow1 img {
            width: 70%;
            padding: 0px 200px;
            margin: 50px 10px;
            top: 20px;
            text-align: center;
        }

        /*footer*/
        footer {
            background-color: rgb(218, 218, 218);
            display: inline-block;
            width: 100%;
            height: 200px;
            position: relative;
            padding: 50px 10px;
            margin: 100px 0px;
            top: 100px;
            margin-top: 0px;
        }

        .gioithieu {
            width: 60%;
            position: absolute;
            top: 30px;
            left: 10px;
            font-size: 15px;
            letter-spacing: 3px;
            padding: 5px 30px;
            margin: 10px 30px;
            line-height: 40px;
        }

        .lienhe {
            width: 60%;
            position: absolute;
            top: 45px;
            left: 450px;
            font-size: 18px;
            line-height: 40px;
            letter-spacing: 3px;
        }

        .lienhe .icon a {
            font-size: 35px;
            color: black;
            height: 2em;
        }

        .info p {
            font-size: 18px;
            padding: 20px 0px;
            background-color: white;
            text-align: center;
            margin-top: 0px;
            letter-spacing: 3px;
        }

        .bank-icon {
            text-align: right;
        }

        .bank-icon img {
            margin: 10px 30px 6px 0;
            width: 60px;
        }

        /*chạy chữ*/
        .run {
            font-size: 15px;
            color: rgb(192, 100, 100);
            letter-spacing: 14.5px;
        }

        .run1 {
            font-size: 20px;
            color: rgb(192, 100, 100);
            letter-spacing: 14.5px;
        }
        .san-pham {
            position: relative;
            display: inline-block
        }
        .label {
            position: absolute;
            top: 10px;
            right: 10px;
            color: black;
            padding: 5px;
            font-size: 12px;
            transform: rotate(-45deg);
            transform-origin: top right;
            animation: blink 1s infinite alternate;
        }

        @keyframes blink {
            0% {
                opacity: 1;
            }
            50% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<div class="nav">
    <img class="logo" src="/images/LOGO.png" alt="" width="110px" height="60px">
    <ul class="menu">
        <li class="menu_link">
            <a href="/nguoi-dung/trang-chu/${idKh}">HOME</a>
        </li>
        <li class="menu_link">
            <a href="">Sản phẩm</a>
            <ul class="menu_dow2">
                <li><a href="menglasses's.html">Sản phẩm mới</a></li>
                <li><a href="woman.html">Sản phẩm đang sale</a></li>
            </ul>
        </li>
        <li class="menu_link">
            <form method="post">
                <input type="text" name="timKiem" style="width: 7cm; height: 30px;border-radius: 15px; padding-left: 10px">
                <button formaction="/nguoi-dung/tim-kiem/${idKh}">Search</button>
            </form>
        </li>
        <li class="menu_link">
            <a href="/nguoi-dung/blog/${idKh}">BLOG</a>
        </li>
        <c:choose>
            <c:when test="${idKh != 2}">
                <li class="menu_link">
                    <a href="">Thông tin</a>
                    <ul class="menu_dow4">
                        <li><a href="/nguoi-dung/thong-tin-cua-hang/${idKh}">Cửa hàng</a></li>
                        <li><a href="/nguoi-dung/thong-tin/${idKh}">Cá nhân</a></li>
                        <li><a href="/nguoi-dung/view-dang-nhap/2">LOG IN<i class="bx bx-user"></i></a></li>
                    </ul>
                </li>
            </c:when>
            <c:when test="${idKh == 2}">
                <li class="menu_link">
                    <a href="/nguoi-dung/thong-tin-cua-hang/${idKh}">Cửa hàng</a>
                </li>
            </c:when>
        </c:choose>
    </ul>
    <c:choose>
        <c:when test="${idKh != 2}">
            <li class="menu2">
                <a href="/nguoi-dung/view-gio-hang/${idKh}"><i class='bx bxs-shopping-bag'></i></a>
            </li>
        </c:when>
        <c:when test="${idKh == 2}">
            <li class="menu2">
                <a href="/nguoi-dung/view-dang-nhap/2"><i class="bx bx-user"></i></a>
            </li>
        </c:when>
    </c:choose>
</div>
<div class="banner">
    <img src="/images/Banner-web-4x0x0x2.webp"/>
</div>
<div class="container">
    <div class="sales-mode">
        <div class="shipping">
            <div class="icon">
                <a href="#"><i class='bx bxs-truck'></i></a>
                FREE SHIPPING ON ORDERS $200
            </div>
        </div>
        <div class="return">
            <div class="icon">
                <a href="#"><i class='bx bx-package'></i></a>
                EASY RETURNS IN 30 DAYS
            </div>
        </div>
        <div class="warranty">
            <div class="icon">
                <a href="#"><i class='bx bx-medal'></i></a>
                2 YEARS WARRANTY
            </div>
        </div>
    </div>
    <ul class="categories">
        <li class="category"><strong>/Thời trang nam/</strong></li>
    </ul>
    <div class="run">
        <marquee behavior="alternate"><strong>CHÀO MỪNG ĐẾN VỚI NHÓM SUP2301</strong>
        </marquee>
    </div>
</div>
<c:forEach items="${top5}" var="sp">
    <div class="me">
        <div align="center">
            <div class="column">
                <div class="san-pham">
                    <a href="/trang-chu/thong-tin-san-pham/${idKh}/${sp.id}"><img class="images" src="/images/${sp.anhs.get(0).ten_url}"
                                            style="width: 200px;height: 250px"/>
                        <div class="label"><img src="/images/hot.jpg" alt="" width="50px"></div></a>
                    <div class="ten">
                        <a href="mk1.html">${sp.ten}</a></div>
                    <div class="gia">
                            ${sp.giaban}
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</div>
</div>
</div>
<div class="banner_dow">
    <img src="/images/banner1.jpeg" alt="" width="200px" height="350px">
    <img src="/images/banner2.jpg" alt="" width="200px" height="350px">
    <img src="/images/banner3.jpg" alt="" width="200px" height="350px">
    <div class="run1">
        <marquee direction="right">Áo sơ nam là một tr phục đa năng và phổ biến, mang lại vẻ lịch thiệp và trang nhã cho
            người mặc. Bạn có thể linh hoạt kết hợp áo sơ mi với các loại quần khác nhau để tạo phong cách riêng của
            mình
        </marquee>
    </div>
</div>
<div class="container">
    <ul class="categories">
        <li class="category"><strong>/Sản phẩm bán chạy/</strong></li>
    </ul>
</div>
<c:forEach items="${top10}" var="sp">
    <div align="center">
        <div class="column">
            <div class="san-pham">
                <a href="/trang-chu/thong-tin-san-pham/${idKh}/${sp.id}"><img class="images" src="/images/${sp.anhs.get(0).ten_url}"
                                        style="width: 200px;height: 250px"/></a></a>
                <div class="ten">
                    <a href="mk1.html">${sp.ten}</a></div>
                <div class="gia">
                        ${sp.giaban}
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</div>
</div>

<div class="banner_dow1">
    <img src="/images/sale.jpg" alt="">
</div>
<div class="container">
    <ul class="categories">
        <li class="category"><strong>/Sale Off/</strong></li>
    </ul>
</div>
<div>
    <c:forEach items="${page.content}" var="list">
        <div align="center">
            <div class="column">
                <div class="san-pham">
                    <a href="/trang-chu/thong-tin-san-pham/${idKh}/${list.ao.id}"><img class="images" src="/images/${list.ao.anhs.get(0).ten_url}"
                                            style="width: 200px;height: 250px"/>
                        <div class="label"><img src="/images/khuyen_mai.webp" alt="" width="100px"></div>
                    </a></a></a>
                    <div class="ten">
                        <a href="mk1.html">${list.ao.ten}</a></div>
                    <div class="gia">
                        <del>${list.ao.giaban}</del>
                            ${list.ao.giaban * (100 - list.giamGiaSanPham.phanTramGiam)/100}
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<div class="gong" style="padding-top: 500px">
        <c:if test="${not page.first}">
                <a href="?pageNo=${page.number -1}">Pre</a>

        </c:if>
        <c:forEach begin="0" end="${page.totalPages > 1 ? page.totalPages - 1 : 0}" var="i">
                <a class="page-link" href="?pageNo=${i}">${i + 1}</a>

        </c:forEach>
        <c:if test="${not page.last}">

                <a href="?pageNo=${page.number +1}">Next</a>

        </c:if>

</div>
</div>
</div>
<div class="gong">
    <ul class="gong1">
        <li class="gong"><strong>/Áo sơ mi/</strong></li>
    </ul>
</div>
<c:forEach items="${items}" var="sp">
    <div align="center">
        <div class="column">
            <div class="san-pham">
                <a href="/trang-chu/thong-tin-san-pham/${idKh}/${sp.id}"><img class="images" src="/images/${sp.anhs.get(0).ten_url}"
                                        style="width: 200px;height: 250px"/></a></a>
                <div class="ten">
                    <a href="mk1.html">${sp.ten}</a></div>
                <div class="gia">
                        ${sp.giaban}
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</div>
</div>
<footer>
    <div class="gioithieu">
        <h2 class="tieude">HỖ TRỢ KHÁCH HÀNG</h2>
        <p>PHÍ VẬN CHUYỂN</br>
            CHÍNH SÁCH ĐỔI TRẢ</br>
            CHÍNH SÁCH BẢO MẬT</br>
            ĐIỀU KHOẢN DỊCH VỤ</p>
    </div>
    <div class="lienhe">
        <h3 class="tieude">THÔNG TIN</h3>
        <div class="icon">
            <a href="#"><i class='bx bx-map'></i></a>
            Nhóm SUP2301 xưởng UDPM host PhongTT35
        </div>
        <div class="icon">
            <a href="#"><i class='bx bx-phone'></i></a>
            0987 654 321
        </div>
        <div class="icon">
            <a href="#"><i class='bx bxl-facebook-circle'></i></a>
            Áo sơ mi nam
        </div>
        <div class="icon">
            <a href="#"><i class='bx bxl-instagram'></i></i></a>
            localhost:8080
        </div>
    </div>
    <div class="bank">
        <div class="bank-icon">
            <div class="bank-icon-row">

                <img src="/images/ACB-removebg-preview.png">
                <img src="/images/ĐA-removebg-preview.png">
            </div>
            <div class="bank-icon-row">
                <img src="/images/VT-removebg-preview.png">
                <img src="/images/VIB-removebg-preview.png">
                <img src="/images/TC BANK.png">
            </div>
            <div class="bank-icon-row">
                <img src="/images/AG-removebg-preview.png">
                <img src="/images/BIDV-removebg-preview.png">
                <img src="/images/vc-removebg-preview.png">
            </div>
        </div>
</footer>
</body>
</html>