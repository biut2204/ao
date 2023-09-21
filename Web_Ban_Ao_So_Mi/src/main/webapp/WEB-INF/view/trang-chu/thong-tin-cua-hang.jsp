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
<h1 style="text-align: center; padding-top: 3cm">Cửa hàng</h1>
<div style="padding-left: 25%;padding-top: 20px;padding-bottom: 20px">
    <p>
        <span style="display: inline-block;"><b>BILUXURY CẦU GIẤY</b></span>
        <span style="display: inline-block; padding-left: 500px" onclick="toggleView('view_anh')">Xem showroom<i
                class="bx bx-chevron-down"></i></span>
    </p>
    <p style="margin-top: 10px">Địa chỉ: 337 Cầu Giấy, P.Dịch Vọng, Q.Cầu Giấy, TP.Hà Nội</p>
    <p>Thời gian hot động: 8 giờ 30 - 22 giờ 00 (kể cả CN và ngày lễ)</p>
    <p><i class="bx bx-phone"></i>Điện thoại : 0987 654 321</p>
    <p style="padding-top: 5px" onclick="toggleView('view_ban_do')">Xem bản đồ</p>
    <div id="view_anh" style="display:none">
        <img src="/images/cua_hang_1.jpg">
    </div>
    <div id="view_ban_do" style="display:none">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.9762349427897!2d105.78904797492916!3d21.033636880616914!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab4859fca08b%3A0xf2dd26df24102f!2zNi81Mi8zMzcgxJAuIEPhuqd1IEdp4bqleSwgVOG7lSAyMiwgQ-G6p3UgR2nhuqV5LCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1690245710226!5m2!1svi!2s"
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</div>
<hr style="border-style: dashed;margin-left: 25%;margin-right: 20%">
<div style="padding-left: 25%;padding-top: 20px;padding-bottom: 20px">
    <p>
        <span style="display: inline-block;"><b>BILUXURY PHỐ HUẾ</b></span>
        <span style="display: inline-block; padding-left: 508px" onclick="toggleView('view_anh1')">Xem showroom<i
                class="bx bx-chevron-down"></i></span>
    </p>
    <p style="margin-top: 10px">Địa chỉ: 353 Phố Huế, P.Phố Huế, Q.Hai Bà Trưng, TP.Hà Nội</p>
    <p>Thời gian hoạt động: 8 giờ 30 - 22 giờ 00 (kể cả CN và ngày lễ)</p>
    <p><i class="bx bx-phone"></i>Điện thoại : 0987 654 321</p>
    <p style="padding-top: 5px" onclick="toggleView('view_ban_do1')">Xem bản đồ</p>
    <div id="view_anh1" style="display:none">
        <img src="/images/cua_hang_2.jpg">
    </div>
    <div id="view_ban_do1" style="display:none">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.592239288326!2d105.84910337492842!3d21.008976280635366!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab8ac64ad877%3A0x4d037d359123a296!2zMzUzIFAuIEh14bq_LCBQaOG7kSBIdeG6vywgSGFpIELDoCBUcsawbmcsIEjDoCBO4buZaSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1690246078294!5m2!1svi!2s"
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</div>
<hr style="border-style: dashed;margin-left: 25%;margin-right: 20%">
<div style="padding-left: 25%;padding-top: 20px">
    <p>
        <span style="display: inline-block;"><b>BILUXURY 505 NGUYỄN TRÃI</b></span>
        <span style="display: inline-block; padding-left: 440px" onclick="toggleView('view_anh2')">Xem showroom<i
                class="bx bx-chevron-down"></i></span>
    </p>
    <p style="margin-top: 10px">Địa chỉ: 505 Nguyễn Trãi, P.Thanh Xuân Nam, Q.Thanh Xuân, TP.Hà Nội</p>
    <p>Thời gian hot động: 8 giờ 30 - 22 giờ 00 (kể cả CN và ngày lễ)</p>
    <p><i class="bx bx-phone"></i>Điện thoại : 0987 654 321</p>
    <p style="padding-top: 5px" onclick="toggleView('view_ban_do2')">Xem bản đồ</p>
    <div id="view_anh2" style="display:none">
        <img src="/images/cua_hang_3.jpg">
    </div>
    <div id="view_ban_do2" style="display:none">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.134615851906!2d105.79279387852336!3d20.987240330763495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acc710f79043%3A0x9c4f7dd368a69f93!2zNTA1IMSQLiBOZ3V54buFbiBUcsOjaSwgVGhhbmggWHXDom4gTmFtLCBUaGFuaCBYdcOibiwgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1690246115056!5m2!1svi!2s"
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</div>
<div>

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
    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }
</script>
</body>
</html>