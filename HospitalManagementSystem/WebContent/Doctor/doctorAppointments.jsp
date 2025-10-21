<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Assigned Appointments</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 100px;
            padding-bottom: 100px;
        }
        .custom-thead {
            background-color: #4169E1;
            color: white;
        }
    </style>
</head>
<body>
<jsp:include page="../Doctor/DoctorHeader.jsp"></jsp:include>

<div class="container mt-5">
    <h2 class="text-center mb-4">Assigned Appointments</h2>

    <c:if test="${empty appointments}">
        <div class="alert alert-info text-center">No appointments assigned yet.</div>
    </c:if>

    <c:if test="${not empty appointments}">
        <table class="table table-bordered table-striped mx-auto" style="max-width: 1000px;">
            <thead class="custom-thead">
                <tr>
                    <th>Appointment ID</th>
                    <th>Patient Name</th>
                    <th>Slot Date</th>
                    <th>Slot Time</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Prescription</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="appt" items="${appointments}">
                    <tr>
                        <td>${appt.appointmentId}</td>
                        <td>${appt.patientName}</td>
                        <td>${appt.slotDate}</td>
                        <td>${appt.slotTime}</td>
                        <td>${appt.description}</td>
                        <td>${appt.status}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/doctor/prescription?appointmentId=${appt.appointmentId}&patientId=${appt.patientId}"
                               class="btn btn-primary btn-sm">
                                Generate Prescription
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
