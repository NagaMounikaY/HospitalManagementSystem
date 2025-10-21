<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Select Appointment Slot</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <!-- Header Section -->
    <jsp:include page="../Customer/CustomerHeader.jsp"></jsp:include>
<div></div><br><br>

<div class="container mt-5">
    <h2 class="text-center mb-4">Select Appointment Slot</h2>

    <!-- Date selection form -->
    <form action="${pageContext.request.contextPath}/appointment" method="get" class="mb-4 mx-auto" style="max-width: 600px;">
        <input type="hidden" name="action" value="slot"/>
        <input type="hidden" name="appointmentId" value="${param.appointmentId}"/>

        <div class="form-group mb-3">
            <label class="font-weight-bold">Select Date</label>
            <input type="date" class="form-control" name="slotDate"
                   value="${selectedDate}" required onchange="this.form.submit()"/>
        </div>
    </form>

    <!-- Slot selection form -->
    <form action="${pageContext.request.contextPath}/appointment" method="post" class="mx-auto" style="max-width: 600px;">
        <input type="hidden" name="action" value="saveSlot"/>
        <input type="hidden" name="appointmentId" value="${param.appointmentId}"/>
        <input type="hidden" name="slotDate" value="${selectedDate}"/>

        <c:if test="${not empty slotList}">
            <div class="form-group mb-3">
                <label class="font-weight-bold">Select Slot</label>
                <select class="form-control" name="slotId" required>
                    <option value="">-- Select Time Slot --</option>
                    <c:forEach var="slot" items="${slotList}">
                        <option value="${slot.slotId}">${slot.slotTime}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success">Next: Payment</button>
            </div>
        </c:if>

        <c:if test="${empty slotList}">
            <p class="text-center text-muted mt-3">No slots available for the selected date.</p>
        </c:if>
    </form>

    <!-- Error message -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger mt-3 text-center">${errorMessage}</div>
    </c:if>
</div>

<div></div><br><br>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
