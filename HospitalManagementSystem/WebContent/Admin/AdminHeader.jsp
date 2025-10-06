<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Courier Booking System</title>
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
    font-size: 1.8em; /* Increased size for the logo */
    font-weight: bold;
    display: flex;
    align-items: center;
}

header .logo i {
    margin-right: 10px;
}

header nav ul {
    list-style: none;
    display: flex;
    margin: 0;
    padding: 0;
}

header nav ul li {
    margin-left: 20px;
}

header nav ul li a {
    color: #fff;
    text-decoration: none;
    padding: 5px 0; /* Increased padding for better click area */
    font-size: 1.1em; /* Slightly increased font size for navigation links */
    border-radius: 5px;
    transition: background 0.3s ease, transform 0.3s ease; /* Smooth transition for background and transform */
}

header nav ul li a:hover {
    background: #575757;
    transform: scale(1.05); /* Slight scale effect on hover */
}

header nav ul li a strong {
    font-weight: 600; /* Increased font weight for emphasis */
}
</style>
</head>
<body>
  <!-- Header -->
    <header>
        <div class="container">
            <div class="logo"><i class="fa fa-hospital-o"></i> Hospital Core</div>
            <nav>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/Admin/Admin-list.jsp"><i class="fa fa-fw fa-home"></i><strong>Home</strong></a></li>
                    <li><a href="<%= request.getContextPath() %>/register/register-update.jsp"><i class="fa fa-fw fa-user"></i><strong>Profile</strong></a></li>
<li>
    <a href="<%= request.getContextPath() %>/paidAppointments?action=list">
        <i class="fa fa-fw fa-th-large"></i><strong>View Appointments</strong>
    </a>
</li>

                    <li><a href="<%= request.getContextPath() %>/doctorslist"><i class="fa fa-user-md"></i><strong>View Doctors</strong></a></li>
					<li><a href="<%= request.getContextPath() %>/patientlist"><i class="fa fa-wheelchair"></i><strong>View Patients</strong></a></li>
                    <li><a href="<%= request.getContextPath() %>/logout"><i class="fa fa-fw fa-sign-out"></i><strong>LogOut</strong></a></li>
                </ul>
            </nav>
        </div>
    </header>
</body>
</html>
