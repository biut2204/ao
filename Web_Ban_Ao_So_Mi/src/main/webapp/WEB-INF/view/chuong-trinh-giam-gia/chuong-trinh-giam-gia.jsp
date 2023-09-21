<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <title>Thêm sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }

        h2 {
            color: #333333;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .tabs li a.active {
            background-color: #ccc;
            /* Thêm các thuộc tính màu sắc và kiểu dáng khác tùy ý */
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #666666;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #dddddd;
            border-radius: 3px;
            box-sizing: border-box;
            margin-top: 5px;
            margin-bottom: 10px;
        }

        input[type="radio"] {
            margin-top: 5px;
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 3px;
            cursor: pointer;
        }

        /* Định dạng bảng */
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 10px;
        }

        th,
        td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .tabs {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .tabs li {
            display: inline-block;
            margin-right: 10px;
        }

        .tabs li a {
            display: block;
            padding: 10px 15px;
            background-color: #f2f2f2;
            color: #333;
            text-decoration: none;
            border-radius: 3px 3px 0 0;
        }

        .tabs li a:hover {
            background-color: #ccc;
        }

        .tab-content {
            display: none;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-top: none;
            margin-top: -1px;
            border-radius: 0 3px 3px 3px;
        }

        /*chat*/
        #chat-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #f1f1f1;
            border-radius: 5px;
            padding: 10px;
            width: 300px;
            min-height: 50px;
            transition: height 0.3s;
            overflow: hidden;
        }

        #chat-container.open {
            height: 50px;
        }

        #chat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #chat-message {
            margin-top: 10px;
            height: 100%;
            border: none;
            resize: none;
            width: 100%;
        }

        #toggle-button {
            cursor: pointer;
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
<div class="sidebar">
    <a class="active" href="/trang-chu">Trang chủ</a>
    <a href="/chuong-trinh-giam-gia">Chương trình giảm giá</a>
    <a href="/ap-dung">Áp dụng chương trình giảm giá</a>
</div>
<div class="content">
    <h2>Chương trình giảm giá</h2>
    <form method="post">

        <input type="hidden" id="id" name="id" value="${CTGG.id}">

        <label for="ma">Mã chương trình:</label>
        <input type="text" id="ma" name="ma" value="${CTGG.ma}" required>

        <label for="ten">Tên chương trình:</label>
        <input type="text" id="ten" name="ten" value="${CTGG.ten}" required>

        <div class="mb-3">
            <label>Loại chương trình:</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" id="giamgia_sp" name="loai" value="giamgia_sp"
                       onclick="showGiamGiaSanPham()" ${loai == 'giamgia_sp'?'checked':''}>
                <label for="giamgia_sp">Giảm giá sản phẩm</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" id="giamgia_hd" name="loai" value="giamgia_hd"
                       onclick="showGiamGiaHoaDon()" ${loai == 'giamgia_hd'?'checked':''}>
                <label for="giamgia_hd">Giảm giá hóa đơn</label>
            </div>
        </div>

        <div id="giamgia_sanpham" style="display: none;">
            <label for="ngaybd">Ngày bắt đầu:</label>
            <input type="date" id="ngaybd" name="ngaybd" value="${ngayBatDau_sp}">

            <label for="ngaykt">Ngày kết thúc:</label>
            <input type="date" id="ngaykt" name="ngaykt" value="${ngayKetThuc_sp}">

            <label for="tigiam">Phần trăm giảm:</label>
            <input type="text" id="tigiam" name="tigiam" value="${CTGGSP.phanTramGiam}">
        </div>

        <div id="giamgia_hoadon" style="display: none;">
            <label for="sosp">Số sản phẩm hóa đơn trên :</label>
            <input type="number" id="sosp" name="sosp" value="${CTGGHD.soLuongSanPham}">

            <label for="tongtien">Tổng tiền hóa đơn trên :</label>
            <input type="number" id="tongtien" name="tongtien" value="${CTGGHD.soTienHoaDon}">

            <label for="ngaybd_hd">Ngày bắt đầu:</label>
            <input type="date" id="ngaybd_hd" name="ngaybd_hd" value="${ngayBatDau_hd}">

            <label for="ngaykt_hd">Ngày kết thúc:</label>
            <input type="date" id="ngaykt_hd" name="ngaykt_hd" value="${ngayKetThuc_hd}">

            <label for="tigiam_hd">Phần trăm giảm:</label>
            <input type="text" id="tigiam_hd" name="tigiam_hd" value="${CTGGHD.phanTramGiam}">
        </div>

        <input type="submit" formaction="/chuong-trinh-giam-gia/add" value="Thêm">
        <input type="submit" formaction="/chuong-trinh-giam-gia/update" value="Cập nhật">
        <input type="submit" formaction="/chuong-trinh-giam-gia/clear" value="Clear">
    </form>

    <!-- Tạo danh sách tab -->
    <ul class="tabs">
        <li><a href="#shirt" class="tab-link active">Giảm giá sản phẩm</a></li>
        <li><a href="#pants" class="tab-link">Giảm giá hóa đơn</a></li>
    </ul>

    <!-- Tạo nội dung cho các tab -->
    <form method="post">
        <div class="tab-content" id="shirt" style="display: block;">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="mb-3">
                        <label for="searchInput">Tên chương trình: </label>
                        <input type="text" id="searchInput" onkeyup="search()" class="form-control" name="searchTenSP"
                               placeholder="Nhập tên chương trình tìm kiếm...">
                        <ul id="searchResults"></ul>
                    </div>
                    <button type="submit" formaction="/chuong-trinh-giam-gia/search_ten_sp" class="btn btn-primary">Tìm
                        kiếm
                    </button>
                </div>
                <div class="col-md-8 mb-3">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="ngaybd_search">Ngày bắt đầu:</label>
                            <input type="date" id="ngaybd_search" name="ngaybd_search">
                        </div>
                        <div class="col-md-6">
                            <label for="ngaykt_search">Ngày kết thúc:</label>
                            <input type="date" id="ngaykt_search" name="ngaykt_search">
                        </div>
                    </div>
                    <button type="submit" formaction="/chuong-trinh-giam-gia/loc_sp" class="btn btn-primary">Lọc
                    </button>
                </div>
            </div>

            <table>
                <tr>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Phần trăm giảm</th>
                    <th>Ngày bắt đầu</th>
                    <th>Ngày kết thúc</th>
                    <th>Trạng thái</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${page.content}" var="list">
                    <tr>
                        <td>${list.ma}</td>
                        <td>${list.ten}</td>
                        <td>${list.phanTramGiam}</td>
                        <td><c:set var="dateFormat" value="dd/MM/yyyy"/>
                            <fmt:formatDate value="${list.ngayBatDau}" pattern="${dateFormat}"/></td>
                        <td><c:set var="dateFormat1" value="dd/MM/yyyy"/>
                            <fmt:formatDate value="${list.ngayKetThuc}" pattern="${dateFormat1}"/></td>
                        <td><c:choose>
                            <c:when test="${list.trangThai ==0}">Còn hạn</c:when>
                            <c:when test="${list.trangThai ==1}">Hết hạn</c:when>
                        </c:choose></td>
                        <td>
                            <button formaction="/chuong-trinh-giam-gia/detail_sp" name="detail_sp" value="${list.id}"
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

        <div class="tab-content" id="pants" style="display: none;">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="mb-3">
                        <label for="searchInput">Tên chương trình: </label>
                        <input type="text" id="searchInput1" onkeyup="search1()" class="form-control" name="searchTenHD"
                               placeholder="Nhập tên chương trình tìm kiếm...">
                        <ul id="searchResults1"></ul>
                    </div>

                    <button type="submit" formaction="/chuong-trinh-giam-gia/search_ten_hd" class="btn btn-primary">Tìm
                        kiếm
                    </button>
                </div>
                <div class="col-md-8 mb-3">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="ngaybd_hd_search">Ngày bắt đầu:</label>
                            <input type="date" id="ngaybd_hd_search" name="ngaybd_hd_search">
                        </div>
                        <div class="col-md-6">
                            <label for="ngaykt_hd_search">Ngày kết thúc:</label>
                            <input type="date" id="ngaykt_hd_search" name="ngaykt_hd_search">
                        </div>
                    </div>
                    <button type="submit" formaction="/chuong-trinh-giam-gia/loc_hd" class="btn btn-primary">Lọc
                    </button>
                </div>
            </div>
            <table>
                <tr>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Phần trăm giảm</th>
                    <th>Số sản phẩm trên</th>
                    <th>Số tiền hóa đơn trên</th>
                    <th>Ngày bắt đầu</th>
                    <th>Ngày kết thúc</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
                <c:forEach items="${page1.content}" var="list">
                    <tr>
                        <td>${list.ma}</td>
                        <td>${list.ten}</td>
                        <td>${list.phanTramGiam}</td>
                        <td>${list.soLuongSanPham}</td>
                        <td>${list.soTienHoaDon}</td>
                        <td><c:set var="dateFormat" value="dd/MM/yyyy"/>
                            <fmt:formatDate value="${list.ngayBatDau}" pattern="${dateFormat}"/></td>
                        <td><c:set var="dateFormat1" value="dd/MM/yyyy"/>
                            <fmt:formatDate value="${list.ngayKetThuc}" pattern="${dateFormat1}"/></td>
                        <td>${list.trangThai}</td>
                        <td>
                            <button formaction="/chuong-trinh-giam-gia/detail_hd" name="detail_hd" value="${list.id}"
                                    class="btn btn-primary me-2">Detail
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <ul class="pagination">
                <c:if test="${not page1.first}">
                    <li class="page-item">
                        <a href="?pageNo=${page1.number -1}">Pre</a>
                    </li>
                </c:if>
                <c:forEach begin="0" end="${page1.totalPages > 1 ? page1.totalPages - 1 : 0}" var="i">
                    <li class="page-item <c:if test='${i == page1.number}'>active</c:if>">
                        <a class="page-link" href="?pageNo=${i}">${i + 1}</a>
                    </li>
                </c:forEach>
                <c:if test="${not page1.last}">
                    <li class="page-item">
                        <a href="?pageNo=${page1.number +1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>

        <div id="chat-container" class="open">
            <div id="chat-header" onclick="toggleChat()">
                <h4>Chat hỗ trợ</h4>
                <span>-</span>
            </div>
            <div id="chat-messages">
                <div class="chat-message">Tin nhắn 1</div>
                <div class="chat-message">Tin nhắn 2</div>
                <div class="chat-message">Tin nhắn 3</div>
            </div>
            <input type="text" id="chat-input" placeholder="Nhập tin nhắn của bạn">
        </div>
    </form>
</div>
<script>
    function showGiamGiaSanPham() {
        document.getElementById("giamgia_sanpham").style.display = "block";
        document.getElementById("giamgia_hoadon").style.display = "none";
    }

    function showGiamGiaHoaDon() {
        document.getElementById("giamgia_sanpham").style.display = "none";
        document.getElementById("giamgia_hoadon").style.display = "block";
    }

    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra radio button ban đầu được chọn
        var selectedRadio = document.querySelector('input[name="loai"]:checked');

        // Nếu radio button được chọn là "giamgia_sp", hiển thị phần tử "giamgia_sanpham"
        if (selectedRadio && selectedRadio.value === 'giamgia_sp') {
            showGiamGiaSanPham();
        }

        // Nếu radio button được chọn là "giamgia_hd", hiển thị phần tử "giamgia_hoadon"
        if (selectedRadio && selectedRadio.value === 'giamgia_hd') {
            showGiamGiaHoaDon();
        }
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const tabs = document.querySelectorAll(".tabs li a");

        tabs.forEach(function (tab) {
            tab.addEventListener("click", function (event) {
                event.preventDefault();

                // Xóa lớp "active" khỏi tất cả các tab
                tabs.forEach(function (otherTab) {
                    otherTab.classList.remove("active");
                });

                // Thêm lớp "active" cho tab hiện tại
                tab.classList.add("active");

                // Lấy ID của nội dung tab tương ứng
                const target = tab.getAttribute("href");

                // Hiển thị nội dung tab tương ứng và ẩn các tab còn lại
                document.querySelectorAll(".tab-content").forEach(function (content) {
                    content.style.display = "none";
                });
                document.querySelector(target).style.display = "block";
            });
        });
    });
</script>
<script>
    function toggleChat() {
        var chatContainer = document.getElementById("chat-container");
        chatContainer.classList.toggle("open");

        var toggleButton = chatContainer.querySelector("span");
        if (chatContainer.classList.contains("open")) {
            toggleButton.innerText = "-";
        } else {
            toggleButton.innerText = "+";
        }
    }
</script>
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
    function search1() {
        var keyword1 = document.getElementById("searchInput1").value;

        $.ajax({
            url: "/search1",
            data: {"keyword1": keyword1},
            success: function (results1) {
                $("#searchResults1").empty();

                results1.forEach(function (result1) {
                    var liElement = $("<li>").text(result1);

                    liElement.click(function () {
                        $("#searchInput1").val(result1);
                    });

                    liElement.appendTo("#searchResults1");
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