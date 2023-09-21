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
    <!--liên kết css-->
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

        /*sản phẩm xem*/
        .san_pham {
        }

        .san_pham1 {
            left: 200px;
            margin: 0px;
            display: flex;
            height: 25em;
        }

        .san_pham1 > img {
            padding-top: 100px;
        }

        .ten {
            top: 500px;
            margin: 10px;
            padding: 150px 50px;
            letter-spacing: 5px;
            font-size: 20px;

        }

        .ten1 {
            top: 500px;
            margin: 10px;

            letter-spacing: 5px;
            font-size: 20px;

        }

        .gia {
            font-size: 20px;
            text-align: left;
            margin: 10px;
            color: red;
        }

        .gia del {
            color: grey;
        }

        .gio_hang {
            font-family: Arial, Helvetica, sans-serif;
            position: absolute;
            top: 300px;
            left: 750px;
            border: 1.5px solid black;
            padding: 13px 20px;
            border-radius: 30px;
            font-size: 13pt;
        }

        .gio_hang > p {
            text-decoration: none;
            color: black;

        }

        .gio_hang:hover {
            transition: all .3s linear;
            box-shadow: rgb(0 0 0 / 13%) 0px 10px 20px 0px, rgb(0 0 0 / 19%) 0px 3px 9px 0px;
        }

        .gio_hang_AN {
            font-family: Arial, Helvetica, sans-serif;
            position: absolute;
            top: 300px;
            left: 1000px;
            border: 1.5px solid black;
            padding: 13px 20px;
            border-radius: 30px;
            font-size: 13pt;
        }

        .gio_hang_AN > p {
            text-decoration: none;
            color: black;

        }

        .gio_hang_AN:hover {
            transition: all .3s linear;
            box-shadow: rgb(0 0 0 / 13%) 0px 10px 20px 0px, rgb(0 0 0 / 19%) 0px 3px 9px 0px;
        }

        .noi_dung {
            margin: 110px;
            text-align: left;
            height: 10px;
            letter-spacing: 2px;
        }

        .ten .nd p {
            font-size: 15px;
            letter-spacing: 2px;
        }

        /*tìm kiếm*/
        .search {
            overflow: hidden;
            background-color: rgb(223, 188, 123);
            position: relative;
            top: 50px;

        }

        .search-email p {
            text-align: center;
            color: orangered;
            letter-spacing: 3px;
            font-size: 20px;
            padding: 50px 50px;
            margin: 0px 10px;
            margin-top: 10px;
            top: 300px;
        }

        .table {
            border-collapse: collapse;
            width: 40%;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            margin: 50px;
            float: right;
            height: 60em;
        }

        td {
            padding: 10px 30px;
            margin: 10px;
        }

        th {
            padding: 10px 30px;
        }

        .tr1 {
            background-color: rgb(230, 230, 230);
        }

        .tr2 {
            background-color: rgb(248, 248, 248);
        }

        .th1 {
            font-size: 20px;
        }

        .noibat {
            height: 100px;
            top: 10px;
            padding-top: 200px;
        }

        .noibat h1 {
            margin: 5px 40px;
            font-size: 20px;

        }

        .noibat ul li {
            margin: 5px 40px;
            padding: 0px;
            font-family: Arial, Helvetica, sans-serif;
        }

        .vd {
            padding-top: 80px;
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
            margin-top: 100px;
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
            font-size: 15px;
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

        .mieuta {
            padding-top: 30px;
            margin: 30px;
        }

        /*sản phẩm giá tên*/
        .column {
            width: 20%;
            float: left;
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
            font-size: 15px;
            text-decoration: none;
            height: 0px;
            padding-top: 0px;
        }

        .san-pham .ten a {
            text-decoration: none;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 15px;
            color: black;
        }

        .san-pham .ten a:hover {
            color: cornflowerblue;
            transition: color .3s ease-out;
            text-decoration: underline;
        }

        .san-pham img {
            max-width: 100%;
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

        .san-pham .new-icon {
            position: absolute;
            top: 0px;
            right: 0px;
        }

        .danhgia {
            padding-top: 500px;
        }

        .menu_star {
            position: absolute;
            right: 570px;
        }

        .menu_star a {
            font-size: 25px;
            line-height: 70px;
            margin: 0 7px;
            color: black;
        }

        .menu_star a:hover {
            color: red;
            transition: color .2s ease-out;
            width: 100%;
            height: 100%;
        }

    </style>
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
</head>
<table>
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
    <div class="san_pham">
        <div class="san_pham1">
            <img src="/images/${ao.anhs.get(0).ten_url}" alt="" width="700px" height="500px">
            <div class="ten">
                <p>${ao.ten}</p>
                <c:choose>
                    <c:when test="${giamgia != 0}">
                        <div class="gia">
                            <p>
                                <del>${ao.giaban}</del>
                                <strong>${ao.giaban * (100 -giamgia)/100}</strong>
                            </p>
                        </div>
                    </c:when>
                    <c:when test="${giamgia == 0}">
                        <div class="gia">
                            <p>
                                <strong>${ao.giaban}</strong></p>
                        </div>
                    </c:when>
                </c:choose>

                <div class="gio_hang" id="them_giohang" onclick="showGioHang()">
                    <p>ADD TO CART</p>
                </div>
                <div class="gio_hang_AN" id="them_giohang" onclick="showGioHang()">
                    <p>BUY NOW</p>
                </div>
                <div class="nd">
                    <p>Giá và khuyến mãi dự kiến áp dụng đến 23:59 ${time}</p>
                </div>
            </div>
        </div>
        <div id="view_gio_hang" style="display: none;margin-left: 50%">
            <hr style="margin-right: 25%;margin-bottom: 30px">
            <form method="post">
                <div style="margin-bottom: 5px">
                    <label>Màu sắc:</label>
                    <c:forEach items="${itemsdetail}" var="sp">
                        <input name="mauSac" type="radio" value="${sp.mau_sac.id}">${sp.mau_sac.ten}
                    </c:forEach>
                </div>
                <br>
                <div style="margin-bottom: 5px">
                    <label>Size:</label>
                    <c:forEach items="${itemsdetail}" var="sp">
                        <input name="Size" type="radio" value="${sp.size.id}">${sp.size.ten}
                    </c:forEach>
                </div>
                <br>
                <div style="margin-bottom: 5px">
                    <label>Số lượng:</label>
                        <input name="sl" type="number">
                </div>
                <input type="hidden" name="gia" value="${ao.giaban * (100 -giamgia)/100}">
                <br>
                <button formaction="/nguoi-dung/gio-hang/${idKh}/${ao.id}">Mua</button>
            </form>
            <hr style="margin-right: 25%;margin-top: 30px">
        </div>
    </div>


    <table class="table">
        <tr class="th1">
            <th colspan="2">Thông tin chi tiết Áo sơ mi</th>
        </tr>
        <tr class="tr1">
            <td>Giới tính</td>
            <td>Nam</td>
        </tr>
        <tr class="tr2">
            <td>Loại sản phẩm</td>
            <td>Áo sơ mi</td>
        </tr>
        <tr class="tr1">
            <td>Chất vải</td>
            <td>${ao.chat_vai.ten}</td>
        </tr>
        <tr class="tr2">
            <td>Cổ áo</td>
            <td>${ao.co_ao.ten}</td>
        </tr>
        <tr class="tr1">
            <td>Họa tiết</td>
            <td>${ao.hoa_tiet.ten}</td>
        </tr>
        <tr class="tr2">
            <td>Túi áo</td>
            <td>${ao.tui_ao.ten}</td>
        </tr>
        <tr class="tr1">
            <td>Tay áo</td>
            <td>${ao.tay_ao.ten}</td>
        </tr>
        <tr class="tr2">
            <td>Nẹp che áo</td>
            <td>${ao.nep_che_ao.ten}</td>
        </tr>
        <tr class="tr1">
            <td>Cúc áo</td>
            <td>${ao.cuc_ao.ten}</td>
        </tr>
        <tr class="tr2">
            <td>Form áo</td>
            <td>${ao.form.ten}</td>
        </tr>
        <tr class="tr1">
            <td>Hãng</td>
            <td>${ao.hang.ten}</td>
        </tr>
    </table>
    <div class="noibat">
        <h1>Đặc điểm nổi bật</h1>
        <ul>
            <li>${ao.mota}</li>
            <li>${ao.chat_vai.thongtin}</li>
            <li>${ao.chat_vai.huong_dan_bao_quan.chitiet}</li>
        </ul>
    </div>
    <div style="padding-top:50px">
        <c:forEach items="${ao.anhs}" var="anh">
            <img class="images" src="/images/${anh.ten_url}"
                 style="width: 200px;height: 250px"/>
        </c:forEach>
    </div>
    <article class="vd">
        <iframe width="700px" height="390px" src="https://www.youtube.com/embed/kQVYFSGUH1g"
                title="YouTube video player"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowfullscreen></iframe>
    </article>
    <div class="mieuta">
        <h2>Xem thêm sản phẩm khác</h2></div>
    <c:forEach items="${top5}" var="sp">
    <div align="center">
        <div class="column">
            <div class="san-pham">
                <a href="/trang-chu/thong-tin-san-pham/${idKh}/${sp.id}"><img class="images"
                                                                              src="/images/${sp.anhs.get(0).ten_url}"
                                                                              style="width: 200px;height: 250px"/></a></a>
                <div class="ten1">
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
    </div>
    </div>
    <div class="danhgia">
        <div align="center">
            <h3>Hãy đánh giá sản phẩm để giúp những khách hàng khác chọn được sản phẩm tốt nhất!</h3>
            <p>Bạn cảm thấy sản phẩm này như thế nào? (chọn sao nhé)</p>
            <ul class="menu_star">
                <a href="#"><i class='bx bx-star'></i></a>
                <a href="#"><i class='bx bx-star'></i></a>
                <a href="#"><i class='bx bx-star'></i></a>
                <a href="#"><i class='bx bx-star'></i></a>
                <a href="#"><i class='bx bx-star'></i></a>
                <hr>
            </ul>
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
    <script>

        function showGioHang() {
            document.getElementById("view_gio_hang").style.display = "block";
        }

        document.addEventListener("DOMContentLoaded", function () {
            var selectedRadio = document.querySelector('input[name="them_giohang"]:checked');
            if (selectedRadio && selectedRadio.value === 'them_giohang') {
                showGioHang();
            }
        });
    </script>
    </body>
</html>