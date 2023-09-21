<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Thanh Toán</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"],
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        button:hover {
            background-color: #45a049;
        }

        #otpSection,
        #loadingSection,
        #successSection {
            margin-top: 20px;
        }

        #otpSection label,
        #otpSection input,
        #payButton {
            display: block;
            margin-bottom: 10px;
        }

        #loadingSection p,
        #successSection p {
            font-weight: bold;
        }
    </style>
</head>
<body>
<h2>Form Thanh Toán</h2>

<form id="paymentForm" action="/hoa-don" method="POST">
    <label for="name">Họ và Tên:</label>
    <input type="text" id="name" name="name" required>

    <label for="accountNumber">Số tài khoản:</label>
    <input type="text" id="accountNumber" name="accountNumber" required>

    <label for="amount">Số tiền:</label>
    <input type="number" id="amount" name="amount" required>

    <input type="submit" value="Xác nhận">
</form>

<div id="otpSection" style="display: none;">
    <label for="otp">Nhập mã OTP:</label>
    <input type="text" id="otp" name="otp" required>

    <button id="payButton">Thanh toán</button>
</div>

<div id="loadingSection" style="display: none;">
    <p>Đang xử lý...</p>
</div>

<div id="successSection" style="display: none;">
    <p>Thanh toán thành công!</p>
</div>

<script>
    const paymentForm = document.getElementById("paymentForm");
    const otpSection = document.getElementById("otpSection");
    const payButton = document.getElementById("payButton");
    const loadingSection = document.getElementById("loadingSection");
    const successSection = document.getElementById("successSection");

    paymentForm.addEventListener("submit", function(event) {
        event.preventDefault();
        otpSection.style.display = "block";
    });

    payButton.addEventListener("click", function() {
        otpSection.style.display = "none";
        loadingSection.style.display = "block";
        setTimeout(function() {
            loadingSection.style.display = "none";
            successSection.style.display = "block";
            setTimeout(function() {
                window.location.href = "/thanh-toan/thanh-toan/${idThanhToan}";
            }, 1000);
        }, 5000);
    });
</script>
</body>
</html>
