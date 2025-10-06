<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.srm.hms.model.Users" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Doctor List</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
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

    <div class="container mt-5">
        <h3 class="text-center">List of Doctors <i class="fa fa-user-md"></i></h3>
        <hr>
        <table class="table table-bordered table-striped table-hover mt-4">
            <thead class="custom-thead">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="doctor" items="${doctorList}">
                    <tr>
                        <td><c:out value="${doctor.user_firstName}" /></td>
                        <td><c:out value="${doctor.user_lastName}" /></td>
                        <td><c:out value="${doctor.user_email}" /></td>
                        <td><c:out value="${doctor.user_mobile_number}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>
