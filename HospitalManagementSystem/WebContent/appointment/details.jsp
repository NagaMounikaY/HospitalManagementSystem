<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
    import="com.srm.hms.model.Users, java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Book Appointment - Patient Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <!-- Header Section -->
    <jsp:include page="../Customer/CustomerHeader.jsp"></jsp:include>
<div></div><br><br>

<div class="container mt-5">
    <h2 class="text-center mb-4">Enter Patient Details</h2>

    <%
        Users user = (Users) session.getAttribute("user");
        int userId = user.getUser_id();
        String userName = user.getUser_firstName() + " " + user.getUser_lastName();
    %>

    <form action="${pageContext.request.contextPath}/appointment" method="post" class="mx-auto" style="max-width: 600px;">
        <input type="hidden" name="action" value="saveDetails" />
        <input type="hidden" name="patientId" value="<%= userId %>" />

        <div class="form-group mb-3">
            <label class="font-weight-bold">Patient Name</label>
            <input type="text" class="form-control" value="<%= userName %>" readonly>
        </div>

        <div class="form-group mb-3">
            <label class="font-weight-bold">Description</label>
            <textarea class="form-control" name="description" rows="4" required></textarea>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Next: Select Slot</button>
        </div>
    </form>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger mt-3 text-center">${errorMessage}</div>
    </c:if>
</div>

<div></div><br><br>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
