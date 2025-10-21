<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Manage Time Slots</title>
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
    </style>
</head>
<body>
<jsp:include page="../Admin/AdminHeader.jsp" />
<div></div><br><br>

<div class="container mt-5">
    <h2 class="text-center mb-4">Manage Time Slots</h2>

    <!-- Display error or success message if any -->
    <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <!-- Add new slot -->
    <form action="${pageContext.request.contextPath}/slots" method="post" class="mb-4">
        <input type="hidden" name="action" value="add"/>
        <div class="input-group">
            <input type="time" name="slotTime" class="form-control" required/>
            <div class="input-group-append">
                <button type="submit" class="btn btn-primary">Add Slot</button>
            </div>
        </div>
    </form>

    <!-- Slot list -->
    <c:if test="${not empty slotList}">
        <table class="table table-bordered table-striped">
            <thead class="custom-thead">
                <tr>
                    <th>Time</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="slot" items="${slotList}">
                    <tr>
                        <td>${slot.slotTime}</td>
                        <td>
                            <c:out value="${slot.active ? 'Active' : 'Inactive'}"/>
                        </td>
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
    </c:if>

    <c:if test="${empty slotList}">
        <p class="text-center mt-3">No time slots available.</p>
    </c:if>
</div>

<div></div><br><br>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
