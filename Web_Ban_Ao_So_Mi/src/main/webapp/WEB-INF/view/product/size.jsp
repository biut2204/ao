<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <form action="/product/size" method="post">
        <input type="text" hidden name="id" value="${item.id}">
        <div class="form-group">
            <label for="formGroupExampleInput">Mã</label>
            <input type="text" name="ma" value="${item.ma}" class="form-control" id="formGroupExampleInput" placeholder="Mã">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2">Tên</label>
            <input type="text" name="ten" value="${item.ten}" class="form-control" id="formGroupExampleInput2" placeholder="Tên">
        </div>
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-2 pt-0">Trạng Thái : </legend>
                <div class="col-sm-10">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="trangthai" id="gridRadios1" value="1" checked ${item.trangthai==1?'checked':''}>
                        <label class="form-check-label" for="gridRadios1">
                            Hoạt Động
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="trangthai" id="gridRadios2" value="0" ${item.trangthai==0?'checked':''}>
                        <label class="form-check-label" for="gridRadios2">
                            Không Hoạt Động
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>
        <button class="btn btn-primary" type="submit">Thêm Mới</button>
    </form>
    <div style="margin: 20px">
        <h1 style="text-transform: uppercase;
    color: black;font-family: 'Lora';text-align: center;">Danh Sách Size Aó</h1>
        <table class="table" style="margin: 20px 0;">
            <thead class="thead-light">
            <tr>
                <th scope="col">Mã</th>
                <th scope="col">Tên Size Aó</th>
                <th scope="col">Trạng Thái</th>
                <th scope="col">Sự Kiện</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${items}" var="sp">
                <tr >
                    <th scope="row">${sp.ma}</th>
                    <th>${sp.ten}</th>
                    <th>${sp.trangthai==1?'Hoạt Động':'Ngừng Hoạt Động'}</th>
                    <th><a href="/product/detail/size/${sp.ma}">Detail</a></th>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
