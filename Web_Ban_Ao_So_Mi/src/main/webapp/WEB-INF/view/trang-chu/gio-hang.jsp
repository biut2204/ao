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
            padding: 12px;
            background-color: rgb(48, 47, 47);
            color: white;
            font-size: larger;
            font-weight: bolder;
            border-radius: 100px;
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

        a.link {
            display: inline-block;
        }
    </style>
    <!--styles-->
    <link rel="stylesheet" href="Dangnhap.css"/>
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
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
                <input type="text" name="timKiem" style="width: 6cm; height: 30px;border-radius: 15px; padding-left: 10px">
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
<form action="/nguoi-dung/gio-hang" method="post" style="padding-top: 1cm">
    <table style="margin-top: 2cm">
        <thead>
        <tr>
            <th></th>
            <th style="padding-left: 1cm">Tên sản phẩm</th>
            <th style="padding-left: 1cm">Hình ảnh</th>
            <th style="padding-left: 1cm">Giá</th>
            <th style="padding-left: 1cm">Số lượng</th>
            <th style="padding-left: 1cm">Đơn giá</th>
            <th style="padding-left: 1cm">Action</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${page.content}" var="list" varStatus="vTri">
            <tr>
                <td style="padding-left: 1cm"><input type="checkbox" name="chon" value="${list.aoChiTiet.id}"></td>
                <td style="padding-left: 1cm">${list.aoChiTiet.ao.ten}</td>
                <td style="padding-left: 1cm"><img src="/images/${list.aoChiTiet.ao.anhs.get(0).ten_url}" alt="" width="50px"></td>
                <td style="padding-left: 1cm"><input type="text" value="${list.donGia/list.soLuong}" readonly id="gia${vTri.index + 1}"></td>
                <td style="padding-left: 1cm"><input type="number" name="soLuong" min="0" max="100" step="1" value="${list.soLuong}"
                           onclick="updateSL(${vTri.index + 1})" id="sl${vTri.index + 1}"></td>
                <td style="padding-left: 1cm"><input type="hidden" name="donGia" readonly id="donGia1${vTri.index + 1}">
                    <input type="text" value="${list.donGia}" readonly id="donGia${vTri.index + 1}">
                    <input type="hidden" id="vTri" value="${vTri.index + 1}"></td>
                <td style="padding-left: 1cm">
                    <button formaction="/gio-hang/clear/${idKh}" name="clear" value="${list.id}" class="btn btn-danger">Clear
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="d-flex justify-content-center">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <c:if test="${not page.first}">
                    <a href="?pageNo=${page.number - 1}">Previous</a>
                </c:if>
                <c:if test="${not page.last}">
                    <a href="?pageNo=${page.number + 1}">Next</a>
                </c:if>
            </ul>
        </nav>
    </div>
    <button type="submit" formaction="/nguoi-dung/add-hoa-don/${idKh}" style="margin-top: 2cm;margin-bottom: 3cm">Xuất
        hóa đơn
    </button>
</form>
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
<script>
    var vTriStr = document.getElementById("vTri").value;

    var vTri = parseFloat(vTriStr);

    for (vTri = 1; vTri < 99; vTri++) {
        var gia = parseFloat(document.getElementById("donGia" + vTri).value);

        var gia1 = gia;

        document.getElementById("donGia1" + vTri).value = gia1.toFixed(0);
    }

    function updateSL(vTri) {

        var slStr = document.getElementById("sl" + vTri).value;

        var sl = parseFloat(slStr);

        var giaStr = document.getElementById("gia" + vTri).value;

        var gia = parseFloat(giaStr);

        var tongTien = sl * gia;

        document.getElementById("donGia" + vTri).value = tongTien.toFixed(0);
        document.getElementById("donGia1" + vTri).value = tongTien.toFixed(0);
    }
</script>
</body>
</html>
