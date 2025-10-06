<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Paid Appointments</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="container mt-5">
    <h2 class="text-center mb-4">Paid Appointments</h2>

    <!-- Display error message if any -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <c:if test="${not empty paidList}">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Patient Name</th>
                    <th>Description</th>
                    <th>Slot Date</th>
                    <th>Slot Time</th>
                    <th>Status</th>
                    <th>Assign Doctor</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="appointment" items="${paidList}">
                    <tr>
                        <td>${appointment.patientName}</td>
                        <td>${appointment.description}</td>
                        <td>${appointment.slotDate}</td>
                        <td>${appointment.slotTime}</td>
                        <td>${appointment.status}</td>
                        <td>
                            <form action="paidAppointments?action=assignDoctor" method="post" class="form-inline">
                                <input type="hidden" name="appointmentId" value="${appointment.appointmentId}">
                                <select name="doctorId" class="form-control form-control-sm mr-2" required>
                                    <option value="">Select Doctor</option>
                                    <c:forEach var="doctor" items="${doctorList}">
                                        <option value="${doctor.user_id}">
                                            ${doctor.user_firstName} ${doctor.user_lastName}
                                        </option>
                                    </c:forEach>
                                </select>
                                <button type="submit" class="btn btn-sm btn-success">Assign</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty paidList}">
        <p class="text-center mt-3">No paid appointments available.</p>
    </c:if>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
