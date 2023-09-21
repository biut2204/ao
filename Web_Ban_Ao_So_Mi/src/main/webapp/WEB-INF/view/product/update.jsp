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
    <h3 style="text-align: center">Update Sản Phẩm</h3>
    <form action="/product/update/${item.ma}" method="post">
        <input type="text" hidden name="id" value="${item.id}">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label>Mã Sản Phẩm :</label>
                <input type="text" class="form-control"  placeholder="Mã Sản Phẩm" name="ma" value="${item.ma}">
            </div>
            <div class="form-group col-md-6">
                <label>Tên Sản Phẩm :</label>
                <input type="text" class="form-control"  placeholder="Tên Sản Phẩm" name="ten" value="${item.ten}">
            </div>
        </div>
        <div class="form-group">
            <label>Mô Tả :</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="mota">${item.mota}</textarea>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label >Giá Nhập :</label>
                <input type="text" class="form-control"  placeholder="Giá Nhập Sản Phẩm" name="gianhap" value="${item.gianhap}">

            </div>
            <div class="form-group col-md-6">
                <label >Giá Bán :</label>
                <input type="text" class="form-control"  placeholder="Giá Bán Sản Phẩm" name="giaban" value="${item.giaban}">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label >Chất Vải :</label>
                <select class="form-control" name="chat_vai.id">
                    <c:forEach items="${cv}" var="cv">
                        <option ${item.chat_vai.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label >Cổ Áo</label>
                <select  class="form-control" name="co_ao.id">
                    <c:forEach items="${coao}" var="cv">
                        <option ${item.co_ao.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label>Họa Tiết :</label>
                <select  class="form-control"  name="hoa_tiet.id">
                    <c:forEach items="${hoatiet}" var="cv">
                        <option ${item.hoa_tiet.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label >Túi Áo :</label>
                <select class="form-control" name="tui_ao.id">
                    <c:forEach items="${tuiao}" var="cv">
                        <option  ${item.tui_ao.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label >Tay Áo</label>
                <select  class="form-control"  name="tay_ao.id">
                    <c:forEach items="${tayao}" var="cv">
                        <option ${item.tay_ao.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label>Nẹp Che Áo :</label>
                <select  class="form-control" name="nep_che_ao.id">
                    <c:forEach items="${nepcheao}" var="cv">
                        <option ${item.nep_che_ao.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label >Cúc Áo :</label>
                <select class="form-control" name="cuc_ao.id">
                    <c:forEach items="${cucao}" var="cv">
                        <option ${item.cuc_ao.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label >Form Áo</label>
                <select  class="form-control" name="form.id">
                    <c:forEach items="${form}" var="cv">
                        <option ${item.form.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label>Hãng Áo :</label>
                <select  class="form-control" name="hang.id">
                    <c:forEach items="${hang}" var="cv">
                        <option ${item.hang.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
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
        <button type="submit" class="btn btn-primary">Xác Nhận</button>
    </form>
</div>
<div class="container" style="border: 1px solid black;border-radius: 10px;padding: 20px;margin-left: 300px">
    <h3 style="text-align: center">Màu Sắc, Kích Cỡ Và Số Lượng</h3>
    <form action="/product/createact" method="post">
        <input type="text" hidden name="ao.id" value="${item.id}">
        <input type="text" class="form-control" hidden name="ma" value="${item.ma}">
        <input type="text" class="form-control" hidden name="id" value="${aochitiet.id}">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label >Màu Sắc :</label>
                <select  class="form-control" name="mau_sac.id">
                    <c:forEach items="${mausac}" var="cv">
                        <option ${aochitiet.mau_sac.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label >Kích Cỡ :</label>
                <select  class="form-control" name="size.id">
                    <c:forEach items="${size}" var="cv">
                        <option ${aochitiet.size.id==cv.id?'selected':''} value="${cv.id}">${cv.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label >Số Lượng</label>
            <input type="number" class="form-control" name="slton" value="${aochitiet.slton}">
        </div>
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-2 pt-0">Trạng Thái : </legend>
                <div class="col-sm-10">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="trangthai"  value="1" checked ${aochitiet.trangthai==1?'checked':''}>
                        <label class="form-check-label" for="gridRadios1">
                            Kích Hoạt
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="trangthai"  value="0" ${aochitiet.trangthai==0?'checked':''}>
                        <label class="form-check-label" for="gridRadios2">
                            Ngưng Kích Hoạt
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>
        <button type="submit" class="btn btn-primary">Xác Nhận</button>
    </form>
    <table class="table" style="margin: 20px 0;">
        <thead class="thead-light">
        <tr>
            <th scope="col">Kích Cỡ</th>
            <th scope="col">Màu Sắc</th>
            <th scope="col">Số Lượng</th>
            <th scope="col">Trạng Thái</th>
            <th scope="col">Sự Kiện</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${itemsdetail}" var="sp">
            <tr>
                <th scope="row">${sp.size.ten}</th>
                <th>${sp.mau_sac.ten}</th>
                <th>${sp.slton}</th>
                <th>${sp.trangthai==1?'Kích Hoạt':'Ngưng Kích Hoạt'}</th>
                <th><a href="/product/update/SP2?spct=${sp.id}">Detail</a></th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="container" style="border: 1px solid black;border-radius: 10px;padding: 20px;margin-left: 300px">
    <h3 style="text-align: center">Thêm Ảnh</h3>
    <form action="/product/createanh" enctype="multipart/form-data" method="post">
        <input type="text" class="form-control" hidden name="ma" value="${item.ma}">
        <input type="text" hidden name="ao.id" value="${item.id}">
    <input type="file" name="ten_url1">
        <button type="submit" class="btn btn-primary">Thêm Anh</button>
    </form>
    <div class="form-row">
        <c:forEach items="${anh}" var="sp">
            <div class="form-group col-md-3">
                <img src="/images/${sp.ten_url}" alt="" style="width: 100%">
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>