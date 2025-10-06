<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hospital Management System</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
/* Header */
header {
    background: #00008B;
    color: #fff;
    padding: 15px 0;
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    z-index: 1000;
}

header .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

header .logo {
    font-size: 2em; /* Increased size for the logo */
    font-weight: bold;
}

header nav ul {
    list-style: none;
    display: flex;
    margin: 0;
}

header nav ul li {
    margin-left: 20px;
}

header nav ul li a {
    color: #fff;
    text-decoration: none;
    padding: 10px 15px; /* Increased padding for better click area */
    font-size: 1.2em; /* Increased font size for navigation links */
    border-radius: 5px;
}

header nav ul li a:hover {
    background: #575757;
}
</style>
</head>
<body>
  <!-- Header -->
    <header>
        <div class="container">
            <div class="logo"><i class="fa fa-hospital-o"></i>Hospital Core</div>
            <nav>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/home/Home.jsp"><i class="fa fa-fw fa-home"></i><strong>Home</strong></a></li>
                    <li><a href="<%= request.getContextPath() %>/About/about.jsp"><i class="fa fa-fw fa-info-circle"></i><strong>About</strong></a></li>
                    <li><a href="<%= request.getContextPath() %>/contact/contact.jsp"><i class="fa fa-fw fa-phone"></i><strong>Contact</strong></a></li>
                    <li><a href="<%= request.getContextPath() %>/register"><i class="fa fa-fw fa-user-plus"></i><strong>Register</strong></a></li>
                    <li><a href="<%= request.getContextPath() %>/login"><i class="fa fa-fw fa-sign-in"></i><strong>Login</strong></a></li>
                </ul>
            </nav>
        </div>
    </header>
</body>
</html>
