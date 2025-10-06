<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Select Slot</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">

<h2>Select Appointment Slot</h2>

<!-- Date selection form (reloads page with available slots) -->
<form action="${pageContext.request.contextPath}/appointment" method="get" class="mb-3">
    <input type="hidden" name="action" value="slot"/>
    <input type="hidden" name="appointmentId" value="${param.appointmentId}"/>
    <div class="mb-3">
        <label>Select Date</label>
        <input type="date" class="form-control" name="slotDate"
               value="${selectedDate}" required onchange="this.form.submit()"/>
    </div>
</form>

<!-- Slot selection form -->
<form action="${pageContext.request.contextPath}/appointment" method="post">
    <input type="hidden" name="action" value="saveSlot"/>
    <input type="hidden" name="appointmentId" value="${param.appointmentId}"/>
    <input type="hidden" name="slotDate" value="${selectedDate}"/>

    <div class="mb-3">
        <label>Select Slot</label>
        <select class="form-control" name="slotId" required>
            <c:forEach var="slot" items="${slotList}">
                <option value="${slot.slotId}">${slot.slotTime}</option>
            </c:forEach>
        </select>
    </div>

    <button type="submit" class="btn btn-success">Next: Payment</button>
</form>

<c:if test="${not empty errorMessage}">
    <div class="alert alert-danger mt-3">${errorMessage}</div>
</c:if>

</body>
</html>
