<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <title>Sign Up | Hospital Management System</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style type="text/css">
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    /* Sign-Up Section */
    .signup {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: calc(100vh - 60px); /* Adjusting for header height */
        padding: 20px;
        background: #f4f4f4;
    }

    .signup-form {
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        max-width: 400px;
        width: 100%;
    }

    .signup-form h1 {
        margin-bottom: 20px;
        font-size: 1.5em;
        color: #333;
        text-align: center;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
        font-size: 0.9em; /* Adjust font size for labels */
    }

    input[type="text"], input[type="email"], input[type="password"], select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 0.9em;
        color: #333;
    }

    button {
        width: 100%;
        padding: 10px;
        background: #007BFF;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 1em;
        cursor: pointer;
    }

    button:hover {
        background: #0056b3;
    }

    .links {
        text-align: center;
        margin-top: 15px;
    }

    .links a {
        color: #007BFF;
        text-decoration: none;
    }

    .links a:hover {
        text-decoration: underline;
    }

    .error-message {
        color: red;
        font-size: 0.8em;
        margin-top: 5px;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .signup {
            padding: 10px;
        }

        .signup-form {
            padding: 15px;
        }

        .signup-form h1 {
            font-size: 1.2em;
        }

        label {
            font-size: 0.8em; /* Smaller font size for labels on mobile */
        }
    }
    </style>
</head>
<body>
    <!-- Header Section -->
<%
    String userRole = (String) session.getAttribute("userRole");
    if ("Admin".equals(userRole)) {
        request.getRequestDispatcher("/Admin/AdminHeader.jsp").include(request, response);
    } else { 
        request.getRequestDispatcher("/common/header.jsp").include(request, response);
    } 
%>
<br>
<br>
<br><br><br>
    <!-- Sign-Up Section -->
    <section class="signup">
        <div class="signup-form">
            <h1>Create an Account</h1>
            <c:if test="${not empty errorMessage}">
<div class="alert alert-danger mt-3"><i class="fas fa-exclamation-circle"></i> ${errorMessage}</div>
</c:if>

<c:if test="${not empty NOTIFICATION}">
    <div class="alert alert-success mt-3">
        <i class="fas fa-check-circle"></i> ${NOTIFICATION}
    </div>
</c:if>
            <form id="signupForm" action="<%=request.getContextPath()%>/register" method="POST">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" name="firstName" id="firstName" required>
                    <div id="firstNameError" class="error-message"></div>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" name="lastName" id="lastName" required>
                    <div id="lastNameError" class="error-message"></div>
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile</label>
                    <input type="text" name="mobile" id="mobile" required>
                    <div id="mobileError" class="error-message"></div>
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="userEmail" required>
                    <div id="emailError" class="error-message"></div>
                </div>
                <%--<div class="form-group">
                    <label for="role">User Role</label>
                    <select id="role" name="userRole" required>
                        <option value="">Select Role</option>
                        <option value="Customer">Customer</option>
                        <option value="Admin">Admin</option>
                        <option value="Doctor">Doctor</option>
                    </select>
                    <div id="roleError" class="error-message"></div>
                </div> --%>
                
                <%
                    String signupRole = "Customer"; // default
                    if ("Admin".equals(userRole)) {
                        signupRole = "Doctor";
                    }
                %>

                <input type="hidden" name="userRole" value="<%= signupRole %>">
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                    <div id="passwordError" class="error-message"></div>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                    <div id="confirmPasswordError" class="error-message"></div>
                </div>
                <button type="submit" id="submitButton">Sign Up</button>
            </form>
            <div class="links">
                <p>Already have an account? <a href="<%= request.getContextPath() %>/login">Login here</a></p>
            </div>
        </div>
    </section>

    <!-- Footer Section -->
<script  type="text/javascript" ><%@include file="user.js" %></script>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
