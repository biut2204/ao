<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
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

</head>
<body>
    <div class="sidebar">
        <a class="active" href="/trang-chu">Trang chủ</a>
        <a href="/product">Sản Phẩm</a>
        <a href="/product/coao">Cổ Aó</a>
        <a href="/product/cucao">Cúc Áo</a>
        <a href="/product/form">Form Áo</a>
        <a href="/product/hang">Hãng</a>
        <a href="/product/hoatiet">Họa Tiết</a>
        <a href="/product/mausac">Màu Sắc</a>
        <a href="/product/nepcheao">Nẹp Che Áo</a>
        <a href="/product/size">Size</a>
        <a href="/product/tayao">Tay Áo</a>
        <a href="/product/tuiao">Túi Áo</a>
        <a href="/product/huongdanbaoquan">Hướng dẫn bảo quản</a>
        <a href="/product/chatvai">Chất vải</a>
    </div>
    <div class="container" style="border: 1px solid black;border-radius: 10px;padding: 20px;margin-left: 300px">
        <form class="form-inline">
            <div class="form-group mx-sm-3 mb-2">
                <label class="sr-only">Password</label>
                <input type="text" class="form-control"  placeholder="Tìm Kiếm ">
            </div>
            <button type="submit" class="btn btn-primary mb-2">Tìm Kiếm</button>
            <button type="submit" class=" btn btn-warning mb-2" style="margin: 0 20px">Làm Mới</button>
            <a href="/product/create" class=" btn btn-primary mb-2"> + Tạo Sản Phẩm</a>
        </form>
        <table class="table" style="margin: 20px 0;">
            <thead class="thead-light">
            <tr>
                <th scope="col">Mã</th>
                <th scope="col">Ảnh</th>
                <th scope="col">Tên Sản Phẩm</th>
                <th scope="col">Giá Nhập</th>
                <th scope="col">Giá Bán</th>
                <th scope="col">Chất Vải</th>
                <th scope="col">Hãng</th>
                <th scope="col">Trạng Thái</th>
                <th scope="col">Thao Tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${items}" var="sp">
                <tr >
                    <th scope="row">${sp.ma}</th>
                    <th><img style="width: 100px" src="/images/${sp.anhs.get(0).ten_url}" alt=""></th>
                    <th>${sp.ten}</th>
                    <th>${sp.gianhap}</th>
                    <th>${sp.giaban}</th>
                    <th>${sp.chat_vai.ten}</th>
                    <th>${sp.hang.ten}</th>
                    <th>${sp.trangthai==1?'Hoạt Động':'Ngừng Hoạt Động'}</th>
                    <th><a href="/product/update/${sp.ma}">Chi Tiết</a></th>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>