<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <sf:form action="${action}" method="post" modelAttribute="data">
    <div class="d-flex">
        <div class="col-5">
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Mã</label>
                <div class="col">
                    <sf:input class="form-control" path="ma"  />
                    <sf:errors path="ma" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Tên</label>
                <div class="col">
                    <sf:input class="form-control" path="ten" />
                    <sf:errors path="ten" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">ngay sinh</label>
                <div class="col">
                    <sf:input class="form-control" path="ngay_sinh" type="date" />
                    <sf:errors path="ngay_sinh" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">dia chi</label>
                <div class="col">
                    <sf:input class="form-control" path="dia_chi" />
                    <sf:errors path="dia_chi" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">thanh pho</label>
                <div class="col">
                    <sf:input class="form-control" path="thanh_pho" />
                    <sf:errors path="thanh_pho" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Trạng thái</label>
                <div class="col">
                    <sf:radiobutton  path="trang_thai" value="0"/> Active
                    <sf:radiobutton path="trang_thai" value="1" />inActive
                    <sf:errors path="trang_thai" />
                </div>
            </div>
        </div>
        <div class="col-5" style="margin-left: 50px">
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Quoc Gia</label>
                <div class="col">
                    <sf:input class="form-control" path="quoc_gia" />
                    <sf:errors path="quoc_gia" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Email</label>
                <div class="col">
                    <sf:input class="form-control" path="email" />
                    <sf:errors path="email" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Sdt</label>
                <div class="col">
                    <sf:input class="form-control" path="sdt" />
                    <sf:errors path="sdt" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">chuc Vu</label>
                <div class="col">
                    <sf:select path="cv.id" class="form-select" >
                        <c:forEach items="${listCV}" var="listcv">
                            <sf:option value="${listcv.id}">${listcv.ten}</sf:option>
                        </c:forEach>
                    </sf:select>
                    <sf:errors path="cv" />
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">Mật Khẩu</label>
                <div class="col ">
                    <sf:input class="form-control" path="mat_khau" />
                    <sf:errors path="mat_khau" />
                </div>
            </div>
        </div>
    </div>
    <button class="btn btn-primary">Submit</button>
</div>
</sf:form>
</div>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Mã</th>
            <th scope="col">Tên</th>
            <th scope="col">Ngày Sinh</th>
            <th scope="col">Địa Chỉ</th>
            <th scope="col">Thành Phố</th>
            <th scope="col">Quốc Gia</th>
            <th scope="col">SDT</th>
            <th scope="col">Email</th>
            <th scope="col">Chức Vụ</th>
            <th scope="col">Mật Khẩu</th>
            <th scope="col">trạng thái</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listNV}" var="nv" varStatus="stt">
            <tr>
                <td>${stt.index +1}</td>
                <td>${nv.ma}</td>
                <td>${nv.ten}</td>
                <td>${nv.ngay_sinh}</td>
                <td>${nv.dia_chi}</td>
                <td>${nv.thanh_pho}</td>
                <td>${nv.quoc_gia}</td>
                <td>${nv.sdt}</td>
                <td>${nv.email}</td>
                <td>${nv.cv.ten}</td>
                <td>${nv.mat_khau}</td>
                <td>${nv.trang_thai}</td>
                <td>
                <a href="http://localhost:8080/nhan-vien/edit/${nv.id}" class="btn btn-primary">details</a>
                <a href="http://localhost:8080/nhan-vien/delete/${nv.id}" class="btn btn-primary">delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
</body>
</html>