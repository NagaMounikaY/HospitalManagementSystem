<%@ page language="java" contentType="text/html; charset=UTF-8"  
import="com.srm.hms.model.Users, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Book Appointment - Patient Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
 <%
 Users user = (Users) session.getAttribute("user");
 int userId = user.getUser_id();
 String userName = user.getUser_firstName() + " " + user.getUser_lastName();
  
    %>

<h2>Enter Patient Details</h2>
<form action="${pageContext.request.contextPath}/appointment" method="post">
    <input type="hidden" name="action" value="saveDetails" />

  <div class="mb-3">
        <label>Patient Name</label>
        <input type="text" class="form-control" value="<%= userName %>" readonly>
    </div>

    <!-- Hidden field to send user ID -->
    <input type="hidden" name="patientId" value="<%= userId %>">

    <div class="mb-3">
        <label>Description</label>
        <textarea class="form-control" name="description" required></textarea>
    </div>

    <button type="submit" class="btn btn-primary">Next: Select Slot</button>
</form>

<c:if test="${not empty errorMessage}">
    <div class="alert alert-danger mt-3">${errorMessage}</div>
</c:if>

</body>
</html>
