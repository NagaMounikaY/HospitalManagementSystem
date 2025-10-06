<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Courier Management System</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style type="text/css">
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    /* Login Section */
    .login {
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100vh - 60px); /* Adjusting for header height */
        padding: 20px;
        background: #f4f4f4;
    }

    .container-fluid {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
    }

    .row {
        display: flex;
        width: 100%;
    }

    .col-md-9, .col-lg-6, .col-xl-5 {
        flex: 1;
        padding: 15px;
    }

    .col-md-8, .col-lg-6, .col-xl-4 {
        flex: 1;
        padding: 15px;
    }

    .img-fluid {
        width: 100%;
        height: auto;
        border-radius: 8px;
    }

    .login-form {
        background: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    .login-form h1 {
        margin-bottom: 20px;
        font-size: 2em;
        color: #333;
        text-align: center;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
    }

    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 1em;
        color: #333;
    }

    button {
        width: 100%;
        padding: 10px;
        background: #00008B;
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
        margin-top: 20px;
    }

    .links a {
        display: block;
        color: #007BFF;
        text-decoration: none;
        margin-bottom: 10px;
    }

    .links a:hover {
        text-decoration: underline;
    }

    .error-message {
        color: #d9534f;
        font-weight: bold;
        margin-bottom: 20px;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .login {
            flex-direction: column;
            padding: 10px;
        }

        .row {
            flex-direction: column;
        }
    }
    </style>
</head>
<body>
    <!-- Header Section -->
    <jsp:include page="../common/header.jsp"></jsp:include>
    <br>
    <br>
    <br>
    <br>
    <!-- Login Section -->
    <section class="login">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="https://t4.ftcdn.net/jpg/06/04/90/45/360_F_604904549_XUC134u3Zfng32Y9HSck0hrl8vvlEpb4.jpg" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4">
                    <div class="login-form">
                        <h1>Login to Your Account</h1>
                        <form action="<%=request.getContextPath()%>/login" method="POST">
                            <div class="form-group">
                                <label for="userEmail">Email</label>
                                <input type="text" id="userEmail" name="userEmail" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" required>
                            </div>
                            <button type="submit">Login</button>
                            <% 
                                String errorMessage = (String) request.getAttribute("errorMessage");
                                if (errorMessage != null) {
                                    out.println("<div class='error-message'>" + errorMessage + "</div>");
                                }
                            %>
                        </form>
                        <div class="links">
                            <a href="<%=request.getContextPath()%>/register/register.jsp">Create an Account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer Section -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
