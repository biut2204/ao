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
    <h3 style="text-align: center">THÊM SẢN PHẨM</h3>
    <form action="/product/create" method="post">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label>Mã Sản Phẩm :</label>
                <input type="text" class="form-control"  placeholder="Mã Sản Phẩm" name="ma">
            </div>
            <div class="form-group col-md-6">
                <label>Tên Sản Phẩm :</label>
                <input type="text" class="form-control"  placeholder="Tên Sản Phẩm" name="ten">
            </div>
        </div>
        <div class="form-group">
            <label>Mô Tả :</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="mota"></textarea>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label >Giá Nhập :</label>
                <input type="text" class="form-control"  placeholder="Giá Nhập Sản Phẩm" name="gianhap">

            </div>
            <div class="form-group col-md-6">
                <label >Giá Bán :</label>
                <input type="text" class="form-control"  placeholder="Giá Bán Sản Phẩm" name="giaban">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label >Chất Vải :</label>
                <select class="form-control" name="chat_vai.id">
                    <c:forEach items="${cv}" var="cv">
                        <option value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label >Cổ Áo</label>
                <select  class="form-control" name="co_ao.id">
                    <c:forEach items="${coao}" var="cv">
                        <option value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label>Họa Tiết :</label>
                <select  class="form-control"  name="hoa_tiet.id">
                    <c:forEach items="${hoatiet}" var="cv">
                        <option value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label >Túi Áo :</label>
                <select class="form-control" name="tui_ao.id">
                    <c:forEach items="${tuiao}" var="cv">
                        <option value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label >Tay Áo</label>
                <select  class="form-control"  name="tay_ao.id">
                    <c:forEach items="${tayao}" var="cv">
                        <option value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label>Nẹp Che Áo :</label>
                <select  class="form-control" name="nep_che_ao.id">
                    <c:forEach items="${nepcheao}" var="cv">
                        <option value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label >Cúc Áo :</label>
                <select class="form-control" name="cuc_ao.id">
                    <c:forEach items="${cucao}" var="cv">
                        <option value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label >Form Áo</label>
                <select  class="form-control" name="form.id">
                    <c:forEach items="${form}" var="cv">
                        <option value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label>Hãng Áo :</label>
                <select  class="form-control" name="hang.id">
                    <c:forEach items="${hang}" var="cv">
                        <option value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-2 pt-0">Trạng Thái : </legend>
                <div class="col-sm-10">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="trangthai" id="gridRadios1" value="1" checked>
                        <label class="form-check-label" for="gridRadios1">
                            Hoạt Động
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="trangthai" id="gridRadios2" value="0">
                        <label class="form-check-label" for="gridRadios2">
                            Không Hoạt Động
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>
        <button type="submit" class="btn btn-primary">Xác Nhận</button>

    </form>
</div>
</body>
</html>