<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.srm.hms.model.Users"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User Details</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <style>
        body {
            background-image: url('https://www.business2community.com/wp-content/uploads/2024/04/biggest-ecommerce-companies-featured-image.png');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            color: #333;
        }
        .card {
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.9);
        }
        .card-body {
            padding: 2rem;
        }
        .btn-update {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-update:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
    </style>
</head>
<body>
    <%
        Users userRole = (Users) session.getAttribute("user");
        if ("Admin".equals(userRole.getUser_role())) {
            request.getRequestDispatcher("/Admin/AdminHeader.jsp").include(request, response);
        } else {
            request.getRequestDispatcher("/Customer/CustomerHeader.jsp").include(request, response);
        }
    %>
          <br>
                    <br>
                    <br>
                    <br>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
           
                        <h1 class="card-title mb-4">User Details</h1>
                        <form action="<%=request.getContextPath()%>/profile" method="post">
                            <div class="form-group">
                                <label for="user_firstName">First Name:</label>
                                <input type="text" id="user_firstName" value="<%=userRole.getUser_firstName()%>"
                                    class="form-control" name="user_firstName" required>
                            </div>
                            <div class="form-group">
                                <label for="user_lastName">Last Name:</label>
                                <input type="text" id="user_lastName" value="<%=userRole.getUser_lastName()%>"
                                    class="form-control" name="user_lastName">
                            </div>
                            <div class="form-group">
                                <label for="user_role">Role:</label>
                                <input type="text" id="user_role" value="<%=userRole.getUser_role()%>"
                                    class="form-control" name="user_role" readonly>
                            </div>
                            <div class="form-group">
                                <label for="user_email">Email:</label>
                                <input type="email" id="user_email" value="<%=userRole.getUser_email()%>"
                                    class="form-control" name="user_email" readonly>
                            </div>
                            <div class="form-group">
                                <label for="user_mobile_number">Mobile Number:</label>
                                <input type="tel" id="user_mobile_number" value="<%=userRole.getUser_mobile_number()%>"
                                    class="form-control" name="user_mobile_number" required>
                            </div>
                            <div class="form-group">
                                <label for="user_password">Password:</label>
                                <input type="password" id="user_password" value="<%=userRole.getUser_password()%>"
                                    class="form-control" name="user_password">
                            </div>
                            <button type="submit" class="btn btn-update">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <script>
        // Function to get query parameters
        function getQueryParam(param) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(param);
        }

        // Check if the "success" query parameter is present
        const success = getQueryParam('success');

        if (success === 'true') {
            alert('Profile updated successfully!.. Now go to the profile page .');
        } else if (success === 'false') {
            alert('Failed to update profile. Please try again.');
        }
    </script>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
