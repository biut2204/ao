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
    <style>
        body {
            background-color: white;
        }

        * {
            margin: 0px;
            padding: 0px;
            font-family: Arial, Helvetica, sans-serif;
            top: 0px;
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
            right: 740px;
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
            height: 11em;
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
            right: 73px;
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

        .login .heading {
            font-size: 30px;
            text-align: center;
            margin: 60px 0;
            position: relative;
            word-spacing: 6px;
            margin-top: 150px;
            color: red;
        }

        /* làm đẹp cho h3 (dấu gạch 2 bên) */
        .login .heading:after {
            position: absolute;
            content: "";
            width: 200px;
            height: 7px;
            background-color: rgb(238, 81, 81);
            top: 50px;
            left: 40%;
        }

        .login {
            margin-top: 150px;
            width: 80%;
            margin: 0 auto;
        }

        .login .dangky {
            display: flex;
            /* dàn thẻ con theo hàng dọc */
            flex-direction: column;
        }

        .login .dangky input {
            padding: 20px 15px;
            outline: none;
            border: none;
            transition: all .3 linear;
            margin: 10px 0px;
            font-size: 20px;
        }

        .login .dangky input:focus {
            border: 1px soild red;
        }

        button {
            background-color: rgb(48, 47, 47);
            color: white;
            font-size: larger;
            font-weight: bolder;
        }

        button:hover {
            background-color: gray;
        }

        .link {
            display: block;
            text-decoration: none;
            color: black;
            margin: 30px 0;
        }

        .link:hover {
            color: red;
            font-weight: bolder;
        }

        /*footer*/
        footer {
            background-color: rgb(218, 218, 218);
            display: inline-block;
            width: 100%;
            height: 300px;
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
            left: 500px;
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

        a.link {
            display: inline-block;
        }
    </style>
    <style>
        /* The side navigation menu */
        .sidebar {
            margin: 0;
            padding: 0;
            width: 200px;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            overflow: auto;
        }

        /* Sidebar links */
        .sidebar a {
            display: block;
            color: black;
            padding: 16px;
            text-decoration: none;
        }

        /* Active/current link */
        .sidebar a.active {
            background-color: #04AA6D;
            color: white;
        }

        /* Links on mouse-over */
        .sidebar a:hover:not(.active) {
            background-color: #555;
            color: white;
        }

        /* Page content. The value of the margin-left property should match the value of the sidebar's width property */
        div.content {
            margin-left: 200px;
            padding: 1px 16px;
            height: 1000px;
        }

        /* On screens that are less than 700px wide, make the sidebar into a topbar */
        @media screen and (max-width: 700px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .sidebar a {
                float: left;
            }

            div.content {
                margin-left: 0;
            }
        }

        /* On screens that are less than 400px, display the bar vertically, instead of horizontally */
        @media screen and (max-width: 400px) {
            .sidebar a {
                text-align: center;
                float: none;
            }
        }
    </style>
    <!--styles-->
    <link rel="stylesheet" href="Dangnhap.css"/>
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
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
                <input type="text" name="timKiem"
                       style="width: 6cm; height: 30px;border-radius: 15px; padding-left: 10px;padding-top: 20px">
                <button formaction="/nguoi-dung/tim-kiem/${idKh}"
                        style="width: 100px;height: 50px;margin-top: 10px;border-radius: 25px">Search
                </button>
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
<div class="sidebar" style="padding-top: 5px">
    <a class="active" href="/trang-chu">Trang chủ</a>
    <a href="/hoa-don/cho-thanh-toan/${idKh}">Chờ thanh toán</a>
    <a href="/hoa-don/cho-xac-nhan/${idKh}">Chờ xác nhận</a>
    <a href="/hoa-don/dang-giao/${idKh}">Đang giao</a>
    <a href="/hoa-don/hoan-thanh/${idKh}">Hoàn thành</a>
    <a href="/hoa-don/huy/${idKh}">Đã hủy</a>
    <a href="/nguoi-dung/doi-mat-khau/${idKh}">Đổi mật khẩu</a>
</div>

<!-- Page content -->
<div class="content">
    <div style="padding-top: 100px">
        <form method="post">
            <input type="hidden" name="idKh" value="${idKh}">
            <table class="table">
                <tr>
                    <td scope="col">Mã</td>
                    <td scope="col">Ngày tạo</td>
                    <td scope="col">Tổng tiền</td>
                    <td scope="col">Ghi chú</td>
                    <td scope="col">Action</td>
                </tr>
                <c:forEach items="${page.content}" var="list">
                    <tr>
                        <td scope="row">${list.ma}</td>
                        <td><c:set var="dateFormat" value="dd/MM/yyyy"/>
                            <fmt:formatDate value="${list.ngayTao}" pattern="${dateFormat}"/></td>
                        <td>${list.tongTien}</td>
                        <td>${list.moTa}</td>
                        <td>
                            <button formaction="/hoa-don/huy" name="huy" value="${list.id}"
                                    class="btn btn-primary me-2">Hủy
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <ul class="pagination">
                <c:if test="${not page.first}">
                    <li class="page-item">
                        <a href="?pageNo=${page.number -1}">Pre</a>
                    </li>
                </c:if>
                <c:forEach begin="0" end="${page.totalPages > 1 ? page.totalPages - 1 : 0}" var="i">
                    <li class="page-item <c:if test='${i == page.number}'>active</c:if>">
                        <a class="page-link" href="?pageNo=${i}">${i + 1}</a>
                    </li>
                </c:forEach>
                <c:if test="${not page.last}">
                    <li class="page-item">
                        <a href="?pageNo=${page.number +1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </form>
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
