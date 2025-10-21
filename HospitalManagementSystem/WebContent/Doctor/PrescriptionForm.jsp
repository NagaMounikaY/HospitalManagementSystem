<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Generate Prescription</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5 col-md-6">
    <h2 class="text-center mb-4">Generate Prescription</h2>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/doctor/prescription" method="post">
        <input type="hidden" name="appointmentId" value="${appointmentId}">
        <input type="hidden" name="patientId" value="${patientId}">

        <div class="form-group">
            <label for="medicineDetails">Medicine Details</label>
            <textarea name="medicineDetails" id="medicineDetails"
                      class="form-control" rows="4"
                      placeholder="Enter medicines and dosage..."></textarea>
        </div>

        <div class="form-group">
            <label for="notes">Notes</label>
            <textarea name="notes" id="notes"
                      class="form-control" rows="3"
                      placeholder="Enter any doctor notes..."></textarea>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Save Prescription</button>
    </form>
</div>

</body>
</html>
