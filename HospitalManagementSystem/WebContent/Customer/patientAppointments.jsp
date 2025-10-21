<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>My Appointments</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style type="text/css">
        body {
            color: blue;
            padding-top: 100px;
            padding-bottom: 100px;
        }
        .custom-thead {
            background-color: #4169E1;
            color: white;
        }
        .clickable {
            cursor: pointer;
            text-decoration: underline;
            color: #007bff;
        }
        .clickable:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
<jsp:include page="../Customer/CustomerHeader.jsp"></jsp:include>
<div></div><br><br>

<div class="container mt-5">
    <h2 class="text-center mb-4">My Appointments</h2>

    <c:if test="${empty appointments}">
        <div class="alert alert-info text-center">No appointments found.</div>
    </c:if>

    <c:if test="${not empty appointments}">
        <table class="table table-bordered table-striped mx-auto" style="max-width: 900px;">
            <thead class="custom-thead">
                <tr>
                    <th>Appointment ID</th>
                    <th>Slot Date</th>
                    <th>Slot Time</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Doctor Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="appt" items="${appointments}">
                    <tr>
                        <td>${appt.appointmentId}</td>
                        <td>${appt.slotDate}</td>
                        <td>${appt.slotTime}</td>
                        <td>${appt.description}</td>
                        <td>
                          ${appt.status}
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty appt.doctorName}">
                                    ${appt.doctorName}
                                </c:when>
                                <c:otherwise></c:otherwise>
                            </c:choose>
                        </td>
                         <td>
                            <c:choose>
                                <c:when test="${appt.prescriptionExists}">
                                    <a href="${pageContext.request.contextPath}/patient/downloadPrescription?appointmentId=${appt.appointmentId}"
                                       class="btn btn-sm btn-success">
                                        Download Prescription
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-sm btn-secondary" disabled>No Prescription</button>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<div></div><br><br>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
