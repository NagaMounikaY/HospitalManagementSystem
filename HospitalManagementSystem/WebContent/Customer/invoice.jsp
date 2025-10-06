<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.crimsonlogic.bookmycourier.model.Users"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Invoice Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            margin-bottom: 1rem;
            border-radius: 0.5rem;
        }
        .card-header {
            background-color: #007bff;
            color: white;
        }
        .card-body {
            font-size: 1.1rem;
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .card-text {
            margin-bottom: 0.5rem;
        }
        .card-container {
            max-width: 600px; /* Adjust this value as needed */
            margin: 0 auto; /* Centers the card horizontally */
        }
    </style>
</head>
<body>
    <%
        Users userRole = (Users) session.getAttribute("user");
        if (userRole != null && "Admin".equals(userRole.getUser_role())) {
            request.getRequestDispatcher("/Admin/AdminHeader.jsp").include(request, response);
        } else {
            request.getRequestDispatcher("/Customer/CustomerHeader.jsp").include(request, response);
        }
    %>
    <br>
    <br>
    <br>
    <div class="container mt-4">
    <br>
    <br>
        <c:if test="${not empty invoice}">
            <div class="card-container">
                <div class="card">
                    <div class="card-header">
                        Invoice Information
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Token Number: ${invoice.token_no}</h5>
                        <p class="card-text"><strong>Sender Name:</strong> ${invoice.sender_Name}</p>
                        <p class="card-text"><strong>Receiver Name:</strong> ${invoice.receiver_Name}</p>
                        <p class="card-text"><strong>Tracking Status:</strong> 
                            <a href="status?tokenNo=${invoice.token_no}" class="btn btn-link">${invoice.track_status}</a>
                        </p>
                        <p class="card-text"><strong>Weight:</strong> ${invoice.weight}</p>
                        <p class="card-text"><strong>Mobile Number:</strong> ${invoice.mobile_number}</p>
                        <p class="card-text"><strong>Branch Name:</strong> ${invoice.branch.branch_name}</p>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <br>
    <br>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
