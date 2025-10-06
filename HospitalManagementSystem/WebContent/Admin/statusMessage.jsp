<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import="com.crimsonlogic.bookmycourier.model.Users"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Status Message</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .alert-custom {
            margin-top: 20px;
            padding: 15px;
            border-radius: 5px;
            color: blue; /* Default text color for custom alert */
        }
    </style>
</head>
<body>
    <%
        Users userRole = (Users) session.getAttribute("user");
        if ("Admin".equals(userRole.getUser_role())) {
            request.getRequestDispatcher("/Admin/AdminHeader.jsp").include(request, response);
        } else {
            request.getRequestDispatcher("/Customer/CustomerHeader.jsp").include(request, response);
        }
    %>
<br><br><br>
		<div class="card">
			<div class="card-body">
			<br>
			<br>
        <c:if test="${not empty sessionScope.statusMessage}">
            <div  align="center"  class="alert-custom ${sessionScope.statusMessageType}" role="alert">
                <h1>${sessionScope.statusMessage}</h1>
            </div>
        </c:if>
    </div>
    </div>
<br><br><br><br><br>
  	<jsp:include page="../common/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
