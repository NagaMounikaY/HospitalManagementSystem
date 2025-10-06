<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.srm.hms.model.Users, java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Update Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-image: url('https://th.bing.com/th/id/OIP.leTSSH1pCydNcMq4u1iULwHaEK?w=1000&h=563&rs=1&pid=ImgDetMain');
            background-repeat: repeat;
            background-position: center;
            background-size: cover;
            color: blue;
        }
        .card {
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.9);
        }
        .error-message {
            color: red;
            font-size: 0.875em;
        }
    </style>
</head>
<body>
    <%
        String userRole = (String) session.getAttribute("userRole");
        Users user = (Users) session.getAttribute("user");

        if ("Admin".equals(user.getUser_role())) {
            request.getRequestDispatcher("/Admin/AdminHeader.jsp").include(request, response);
        } else {
            request.getRequestDispatcher("/Customer/CustomerHeader.jsp").include(request, response);
        }
    %>

    <br><br><br><br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
              <c:if test="${not empty errorMessage}">
<div class="alert alert-danger mt-3"><i class="fas fa-exclamation-circle"></i> ${errorMessage}</div>
</c:if>
                <c:choose>
                    <c:when test="${existingCourier != null}">
                        <form action="<%=request.getContextPath()%>/update" method="post" id="courierForm">
                    </c:when>
                    <c:otherwise>
                        <form action="<%=request.getContextPath()%>/insert" method="post" id="courierForm">
                    </c:otherwise>
                </c:choose>

                <caption>
                    <h2>
                        <c:choose>
                            <c:when test="${existingCourier != null}">
                                Edit Courier
                            </c:when>
                            <c:otherwise>
                                Add New Courier
                            </c:otherwise>
                        </c:choose>
                    </h2>
                </caption>

                <c:if test="${existingCourier != null}">
                    <input type="hidden" name="courier_id" value="${existingCourier.courier_id}" />
                </c:if>

                <div class="form-group">
                    <label for="sender_Name">Sender Name:</label>
                    <input type="text" id="sender_Name" name="sender_Name" class="form-control"
                           value="${existingCourier.sender_Name}" required />
                    <div id="sender_NameError" class="error-message"></div>
                </div>

                <div class="form-group">
                    <label for="receiver_Name">Receiver Name:</label>
                    <input type="text" id="receiver_Name" name="receiver_Name" class="form-control"
                           value="${existingCourier.receiver_Name}" />
                    <div id="receiver_NameError" class="error-message"></div>
                </div>

                <div class="form-group">
                    <label for="track_status">Track Status:</label>
                    <select id="track_status" name="track_status" class="form-control">
                        <c:choose>
                            <c:when test="${userRole == 'Admin'}">
                                <option value="approved">Approved</option>
                                <option value="rejected">Rejected</option>
                            </c:when>
                            <c:otherwise>
                                <option value="booked">Booked</option>
                                <option value="cancelled">Cancelled</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                    <div id="track_statusError" class="error-message"></div>
                </div>

                <div class="form-group">
                    <label for="weight">Weight:</label>
                    <input type="number" id="weight" name="weight" class="form-control"
                           value="${existingCourier.weight}" />
                    <div id="weightError" class="error-message"></div>
                </div>

                <div class="form-group">
                    <label for="mobile_number">Mobile Number:</label>
                    <input type="number" id="mobile_number" name="mobile_number" class="form-control"
                           value="${existingCourier.mobile_number}" required />
                    <div id="mobile_numberError" class="error-message"></div>
                </div>

                <c:if test="${userRole != 'Admin'}">
                    <div class="form-group">
                        <label for="branch_id">Select Branch:</label>
                        <select id="branch_id" name="branch_id" class="form-control">
                            <option value="">Select One Branch</option>
                            <c:forEach var="branch" items="${branchList}">
                                <option value="${branch.branch_id}"
                                        ${branch.branch_id == existingCourier.branch_id ? 'selected' : ''}>
                                    ${branch.branch_name}
                                </option>
                            </c:forEach>
                        </select>
                        <div id="branch_idError" class="error-message"></div>
                    </div>
                </c:if>

                <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        function validateField(id, value, regex, errorMsg) {
            let errorElement = document.getElementById(id + 'Error');
            if (!value) {
                errorElement.textContent = "This field is required";
                return false;
            } else if (regex && !regex.test(value)) {
                errorElement.textContent = errorMsg;
                return false;
            } else {
                errorElement.textContent = "";
                return true;
            }
        }

        function validatePassword(password) {
            return {
                lengthValid: password.length >= 6,
                containsDigit: /[0-9]/.test(password),
                containsUpper: /[A-Z]/.test(password),
                containsLower: /[a-z]/.test(password)
            };
        }

        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('sender_Name').addEventListener('input', function() {
                let value = this.value.trim();
                validateField('sender_Name', value, /^[A-Za-z]{4,}$/, "Sender Name must be at least 4 letters long and contain only letters");
            });

            document.getElementById('receiver_Name').addEventListener('input', function() {
                let value = this.value.trim();
                validateField('receiver_Name', value, /^[A-Za-z]+$/, "Receiver Name should contain only letters");
            });

            document.getElementById('mobile_number').addEventListener('input', function() {
                let value = this.value.trim();
                validateField('mobile_number', value, /^[6-9]\d{9}$/, "Please enter a valid 10-digit mobile number starting with 6-9");
            });

            document.getElementById('track_status').addEventListener('change', function() {
                let value = this.value.trim();
                validateField('track_status', value, null, "Please select a track status");
            });

            document.getElementById('weight').addEventListener('input', function() {
                let value = this.value.trim();
                validateField('weight', value, /^\d+(\.\d{1,2})?$/, "Weight must be a positive number");
            });

            document.getElementById('branch_id').addEventListener('change', function() {
                let value = this.value.trim();
                validateField('branch_id', value, null, "Please select a branch");
            });

            document.getElementById('courierForm').addEventListener('submit', function(event) {
                event.preventDefault(); // Prevent the form from submitting immediately

                let senderName = document.getElementById('sender_Name').value.trim();
                let receiverName = document.getElementById('receiver_Name').value.trim();
                let mobileNumber = document.getElementById('mobile_number').value.trim();
                let trackStatus = document.getElementById('track_status').value.trim();
                let weight = document.getElementById('weight').value.trim();
                let branchId = document.getElementById('branch_id').value.trim();

                let isValid = true;
                isValid &= validateField('sender_Name', senderName, /^[A-Za-z]{4,}$/, "Sender Name must be at least 4 letters long and contain only letters");
                isValid &= validateField('receiver_Name', receiverName, /^[A-Za-z]+$/, "Receiver Name should contain only letters");
                isValid &= validateField('mobile_number', mobileNumber, /^[6-9]\d{9}$/, "Please enter a valid 10-digit mobile number starting with 6-9");
                isValid &= validateField('track_status', trackStatus, null, "Please select a track status");
                isValid &= validateField('weight', weight, /^\d+(\.\d{1,2})?$/, "Weight must be a positive number");
                isValid &= validateField('branch_id', branchId, null, "Please select a branch");

                if (isValid) {
                    alert('Please confirm your details!');
                    this.submit(); // Submit the form if all fields are valid
                }
            });
        });
    </script>
    <br><br>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
