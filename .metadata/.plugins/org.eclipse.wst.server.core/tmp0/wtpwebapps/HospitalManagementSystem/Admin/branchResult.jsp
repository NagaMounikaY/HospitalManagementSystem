<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Couriers</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
    body{
            color:blue;
        }
    </style>
</head>
<body>
<jsp:include page="../Admin/AdminHeader.jsp"></jsp:include>
<br>
<br>
<br>
 <div class="container">
 <br>
 <br>
 <br>
        <h2>Search Couriers by Branch Name</h2>
        <form action="<%=request.getContextPath()%>/search" method="get">
            <div class="form-group">
                <label for="branch_name">Branch Name:</label>
                <input type="text" class="form-control" id="branch_name" name="branch_name"  placeholder="Enter the branch" required>
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
        
         <c:if test="${not empty message}">
            <div class="alert alert-info mt-3">
                <c:out value="${message}"/>
            </div>
        </c:if>
   <c:if test="${not empty couriers}">
            <h3 class="mt-4">Couriers List</h3>
            <table class="table table-striped mt-2">
                <thead>
                <tr>
                    <th>Courier ID</th>
                    <th>Token Number</th>
                    <th>Sender Name</th>
                    <th>Receiver Name</th>
                    <th>Track Status</th>
                    <th>Mobile Number</th>
                    <th>Weight</th>
                    <th>Branch</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="courier" items="${couriers}">
                    <tr>
                        <td><c:out value="${courier.courier_id}"/></td>
                        <td><a href="status?tokenNo=${courier.token_no}" class="btn btn-primary">${courier.token_no}</a></td>
                        <td><c:out value="${courier.sender_Name}"/></td>
                        <td><c:out value="${courier.receiver_Name}"/></td>
                        <td><c:out value="${courier.track_status}"/></td>
                        <td><c:out value="${courier.mobile_number}"/></td>
                        <td><c:out value="${courier.weight}"/></td>
                        <td><c:out value="${courier.branch_name}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </c:if>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
