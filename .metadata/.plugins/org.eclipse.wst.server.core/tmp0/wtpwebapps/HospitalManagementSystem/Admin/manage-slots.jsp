<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Manage Slots</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">

<h2>Manage Time Slots</h2>

<!-- Add new slot -->
<form action="${pageContext.request.contextPath}/slots" method="post" class="mb-4">
    <input type="hidden" name="action" value="add"/>
    <div class="input-group">
        <input type="time" name="slotTime" class="form-control" required/>
        <button type="submit" class="btn btn-primary">Add Slot</button>
    </div>
</form>

<!-- Slot list -->
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Time</th><th>Status</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="slot" items="${slotList}">
            <tr>
                <td>${slot.slotTime}</td>
                <td><c:out value="${slot.active ? 'Active' : 'Inactive'}"/></td>
                <td>
                    <form action="${pageContext.request.contextPath}/slots" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="deactivate"/>
                        <input type="hidden" name="slotId" value="${slot.slotId}"/>
                        <button type="submit" class="btn btn-sm btn-danger">Deactivate</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
