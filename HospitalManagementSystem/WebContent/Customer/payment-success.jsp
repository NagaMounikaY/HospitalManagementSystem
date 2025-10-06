<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Payment Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; color: #333; }
        .card { border-radius: 20px; margin-top: 50px; }
        .success-icon { font-size: 50px; color: green; }
    </style>
</head>
<body>
    <div class="container">
        <div class="card p-4 shadow-sm">
            <div class="text-center">
                <div class="success-icon">&#10004;</div>
                <h2 class="mt-3">Payment Successful!</h2>
                <p>Thank you for your payment.</p>
            </div>
            <hr>
            <div class="mt-3">
                <p><strong>Amount Paid:</strong> ₹<c:out value="${payment.amount}"/></p>
                <p><strong>Transaction ID:</strong> <c:out value="${payment.transaction_id}"/></p>
                <p><strong>Payment Date:</strong> <c:out value="${payment.payment_date}"/></p>
                <p><strong>Payment Mode:</strong> <c:out value="${payment.payment_mode}"/></p>
            </div>
            <div class="text-center mt-4">
                <a href="<%=request.getContextPath()%>/Customer/Customer-list.jsp" class="btn btn-primary">Back to Dashboard</a>
            </div>
        </div>
    </div>
</body>
</html>
