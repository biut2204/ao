<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Áp dụng phiếu giảm giá</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        button[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 3px;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
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
</head>
<body>
<div>
    <div class="sidebar">
        <a class="active" href="/trang-chu">Trang chủ</a>
        <a href="/chuong-trinh-giam-gia">Chương trình giảm giá</a>
        <a href="/ap-dung">Áp dụng chương trình giảm giá</a>
    </div>
    <div class="content">
        <h1>Áp dụng phiếu giảm giá</h1>

        <div class="row">
            <div class="col-md-8">
                <form id="discount-form" method="post">
                    <div class="mb-3">
                        <label for="searchInput">Tên sản phẩm: </label>
                        <input type="text" id="searchInput2" onkeyup="search2()" class="form-control" name="tenSanPham"
                               placeholder="Nhập tên sản phẩm...">
                        <ul id="searchResults2"></ul>
                    </div>

                    <div class="mb-3">
                        <label for="searchInput">Chương trình: </label>
                        <input type="text" id="searchInput" onkeyup="search()" class="form-control" name="tenChuongTrinh"
                               placeholder="Nhập tên chương trình...">
                        <ul id="searchResults"></ul>
                    </div>

                    <button type="submit" formaction="/chuong-trinh-giam-gia/ap-dung-san-pham">Áp dụng phiếu giảm giá</button>
                </form>
            </div>
            <div class="col-md-4">
                <img src="/images/a21.jpg" alt="" width="100%">
            </div>
        </div>
        <form method="post">
            <div class="row">
                <table class="table">
                    <tr>
                        <th scope="col">Mã sản phẩm</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Giá nhập</th>
                        <th scope="col">Giá bán gốc</th>
                        <th scope="col">Phần trăm giảm</th>
                        <th scope="col">Giá bán sau khi giảm giá</th>
                        <th scope="col">Ngày bắt đầu</th>
                        <th scope="col">Ngày kết thúc</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Action</th>
                    </tr>
                    <c:forEach items="${page.content}" var="list">
                        <tr>
                            <td  scope="row">${list.ao.id}</td>
                            <td>${list.ao.ten}</td>
                            <td>${list.ao.gianhap}</td>
                            <td>${list.ao.giaban}</td>
                            <td>${list.giamGiaSanPham.phanTramGiam}%</td>
                            <td>${list.ao.giaban * (100 - list.giamGiaSanPham.phanTramGiam)/100}</td>
                            <td><c:set var="dateFormat" value="dd/MM/yyyy"/>
                                <fmt:formatDate value="${list.giamGiaSanPham.ngayBatDau}" pattern="${dateFormat}"/></td>
                            <td><c:set var="dateFormat1" value="dd/MM/yyyy"/>
                                <fmt:formatDate value="${list.giamGiaSanPham.ngayKetThuc}" pattern="${dateFormat1}"/></td>
                            <td>${list.trangThai}</td>
                            <td>
                                <button formaction="/chuong-trinh-giam-gia/detail_sp" name="detail" value="${list.id}"
                                        class="btn btn-primary me-2">Detail
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
            </div>
        </form>
    </div>
</div>
<script>
    function search() {
        var keyword = document.getElementById("searchInput").value;

        $.ajax({
            url: "/search",
            data: {"keyword": keyword},
            success: function (results) {
                $("#searchResults").empty();

                results.forEach(function (result) {
                    var liElement = $("<li>").text(result);

                    liElement.click(function () {
                        $("#searchInput").val(result);
                    });

                    liElement.appendTo("#searchResults");
                });
            }
        });
    }
</script>

<script>
    function search2() {
        var keyword2 = document.getElementById("searchInput2").value;

        $.ajax({
            url: "/search2",
            data: {"keyword2": keyword2},
            success: function (results2) {
                $("#searchResults2").empty();

                results2.forEach(function (result2) {
                    var liElement = $("<li>").text(result2);

                    liElement.click(function () {
                        $("#searchInput2").val(result2);
                    });

                    liElement.appendTo("#searchResults2");
                });
            }
        });
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-CLJ6+PdEa2l9thF3mUqsFfL0ZGKk4j5AqCDh1iDxXwHbjWU7gVvKCTniBbYlX8iQ"
        crossorigin="anonymous"></script>
</body>
</html>
