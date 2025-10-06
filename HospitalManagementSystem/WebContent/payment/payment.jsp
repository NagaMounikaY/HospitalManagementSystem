<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Payment Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          crossorigin="anonymous">
    <style>
        body { color: blue; }
        .card { border-radius: 20px; }
        .form-group label { font-weight: bold; }
        .btn-warning { background-color: #FF8C00; border-color: #FF8C00; }
        .hidden { display: none; }
        .custom-date-format { display: inline-block; position: relative; }
        .custom-date-format input { padding-right: 60px; }
        .custom-date-format::after {
            content: 'MM/YY';
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            pointer-events: none;
        }
        .error { color: red; }
    </style>
</head>
<body>
<jsp:include page="../Customer/CustomerHeader.jsp"></jsp:include>
<br><br><br>

<div class="container mt-5 mb-5">
    <div class="card">
        <div class="card-body">
            <h2 class="text-uppercase text-center mb-4">Payment</h2>

            <!-- Display error if present -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <form action="<%=request.getContextPath()%>/payment" method="post">
            
             <!-- Hidden field for appointment ID -->
   <input type="hidden" name="appointmentId" value="${param.appointmentId}"/>
                
                <!-- Auto-populated Amount -->
                <fieldset class="form-group">
                    <label for="amount">Amount:</label>
                    <input type="number" class="form-control" id="amount" name="amount"
                           value="500" readonly>
                </fieldset>

                <fieldset class="form-group">
                    <label for="payment_date">Payment Date:</label>
                    <input type="date" class="form-control" id="payment_date" name="payment_date"
                           value="${param.payment_date != null ? param.payment_date : ''}" required>
                </fieldset>

                <fieldset class="form-group">
                    <label for="payment_mode">Payment Mode:</label>
                    <select class="form-control" id="payment_mode" name="payment_mode" onchange="togglePaymentFields()">
                        <option value="">Select Payment Mode</option>
                        <option value="Credit Card" ${param.payment_mode == 'Credit Card' ? 'selected' : ''}>Credit Card</option>
                        <option value="Debit Card" ${param.payment_mode == 'Debit Card' ? 'selected' : ''}>Debit Card</option>
                    </select>
                </fieldset>

                <!-- Card details fields -->
                <div id="card-details" class="${param.payment_mode == 'Credit Card' || param.payment_mode == 'Debit Card' ? '' : 'hidden'}">
                    <fieldset class="form-group">
                        <label for="card_number">Card Number:</label>
                        <input type="text" class="form-control" id="card_number" name="card_number"
                               value="${param.card_number != null ? param.card_number : ''}">
                        <div id="card_numberError" class="error"></div>
                    </fieldset>

                    <fieldset class="form-group custom-date-format">
                        <label for="expire_date">Expire Date:</label>
                        <input type="text" class="form-control" id="expire_date" name="expire_date"
                               value="${param.expire_date != null ? param.expire_date : ''}">
                        <div id="expire_dateError" class="error"></div>
                    </fieldset>

                    <fieldset class="form-group">
                        <label for="cvv_number">CVV:</label>
                        <input type="password" class="form-control" id="cvv_number" name="cvv_number"
                               value="${param.cvv_number != null ? param.cvv_number : ''}">
                        <div id="cvv_numberError" class="error"></div>
                    </fieldset>
                </div>

                <button type="submit" class="btn btn-primary">Submit Payment</button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        // Set default payment date if empty
        var paymentDate = document.getElementById('payment_date');
        if (!paymentDate.value) {
            var today = new Date().toISOString().split('T')[0];
            paymentDate.value = today;
        }
    });

    function togglePaymentFields() {
        var paymentMode = document.getElementById('payment_mode').value;
        var cardDetails = document.getElementById('card-details');
        cardDetails.classList.toggle('hidden', !(paymentMode === 'Credit Card' || paymentMode === 'Debit Card'));
    }

    // Card number validation
    document.getElementById('card_number').addEventListener('input', function() {
        let value = this.value.trim();
        document.getElementById('card_numberError').textContent =
            /^\d{16}$/.test(value) ? '' : 'Card Number must be exactly 16 digits';
    });

    // Expire date validation
    document.getElementById('expire_date').addEventListener('input', function() {
        let value = this.value.trim();
        document.getElementById('expire_dateError').textContent =
            /^\d{2}\/\d{2}$/.test(value) ? '' : 'Expire Date must be in MM/YY format';
    });

    // CVV validation
    document.getElementById('cvv_number').addEventListener('input', function() {
        let value = this.value.trim();
        document.getElementById('cvv_numberError').textContent =
            /^\d{3,4}$/.test(value) ? '' : 'CVV must be 3 or 4 digits';
    });
</script>

<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
