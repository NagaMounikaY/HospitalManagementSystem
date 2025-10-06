<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.crimsonlogic.bookmycourier.model.Payments" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 2rem;
        }
        .table thead th {
            background-color: #007bff;
            color: white;
        }
        .table td, .table th {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <jsp:include page="../Admin/AdminHeader.jsp"></jsp:include>
<br><br><br>
    <div class="container">
    <br><br>
        <h2 class="mb-4">Payment List</h2>
        <c:if test="${not empty payments}">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Amount</th>
                        <th>Date</th>
                        <th>Mode</th>
                        <th>Transaction ID</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="payment" items="${payments}">
                        <tr>
                            <td>${payment.user_id}</td>
                            <td>${payment.amount}</td>
                            <td>${payment.payment_date}</td>
                            <td>${payment.payment_mode}</td>
                            <td>${payment.transaction_id}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty payments}">
            <div class="alert alert-warning" role="alert">
                No payments found.
            </div>
        </c:if>
    </div>
<br><br><br><br><br><br>
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
