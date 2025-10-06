<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Branch</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<style>
body{
    background-image: url('https://th.bing.com/th/id/R.e34c540f8c2306ef80e698bd7b9da0b4?rik=9q0BHXqaTJEVgA&riu=http%3a%2f%2fwww.ontime360.com%2fblog%2fimage.axd%3fpicture%3dstart-courier-service.jpg&ehk=U1x%2fBenKzEBVj4FK%2bCj6VvXYmCXhI3cFWtigrycHbTg%3d&risl=&pid=ImgRaw&r=0');
    background-repeat: repeat; /* Prevent repeating of the background image */
    background-position: center; /* Center the background image */
    background-size: cover; /* Cover the entire page */
    color: blue; /* Text color */
}
.card {
    border-radius: 20px;
    background: rgba(255, 255, 255, 0.9);
}
</style>
<body>
<jsp:include page="../Admin/AdminHeader.jsp"></jsp:include>
<br>
<br>
<br>
<div class="container col-md-5">
<br>
<br>
    <div class="card" style="border-radius: 20px;">
        <div class="card-body">
        <br><br>
        <c:if test="${existingBranch != null}">
                <form action="<%=request.getContextPath()%>/updatebranch" method="post" id="branchForm" />
            </c:if>
            <c:if test="${existingBranch == null}">
                <form action="<%=request.getContextPath()%>/branch" method="post" id="branchForm" />
            </c:if>
            <caption>
                <h2>
                    <c:if test="${existingBranch != null}">
                    Edit Branch
                    </c:if>
                    <c:if test="${existingBranch == null}">
                    Add New Branch
                    </c:if>
                </h2>
            </caption>
            <c:if test="${existingBranch != null}">
            <input type="hidden" name="branch_id"
                value="<c:out value='${existingBranch.branch_id}' />" />
            </c:if>

            <fieldset class="form-group">
            <label>Branch Name:</label> 
            <input type="text" class="form-control" id="branch_name" name="branch_name"
                value="<c:out value='${existingBranch.branch_name}' />" required="required" minlength="5" onchange="validateField('branch_name', this.value, /^[A-Za-z\s]{5,}$/, 'Branch Name must be at least 5 characters long and contain only letters')">
            <div id="branch_nameError" style="color: red;"></div>
            </fieldset>
            <fieldset class="form-group">
            <label>Street:</label> 
            <input type="text" class="form-control" id="street" name="street"
                value="<c:out value='${existingBranch.street}' />" required="required" minlength="5" onchange="validateField('street', this.value, /^[A-Za-z0-9\s,]{5,}$/, 'Street must be at least 5 characters long and contain only letters and numbers')">
            <div id="streetError" style="color: red;"></div>
            </fieldset>

            <fieldset class="form-group">
            <label>City:</label> 
            <input type="text" class="form-control" id="city" name="city"
                value="<c:out value='${existingBranch.city}' />" minlength="5" onchange="validateField('city', this.value, /^[A-Za-z\s]{5,}$/, 'City must be at least 5 characters long and contain only letters')">
            <div id="cityError" style="color: red;"></div>
            </fieldset>

            <fieldset class="form-group">
            <label>State:</label> 
            <input type="text" class="form-control" id="state" name="state"
                value="<c:out value='${existingBranch.state}' />" minlength="5" onchange="validateField('state', this.value, /^[A-Za-z\s]{5,}$/, 'State must be at least 5 characters long and contain only letters')">
            <div id="stateError" style="color: red;"></div>
            </fieldset>

            <fieldset class="form-group">
            <label>Country:</label> 
            <input type="text" class="form-control" id="country" name="country"
                value="<c:out value='${existingBranch.country}' />" required="required" onchange="validateField('country', this.value, /^[A-Za-z\s]+$/, 'Country is required and must contain only letters')">
            <div id="countryError" style="color: red;"></div>
            </fieldset>
            
            <fieldset class="form-group">
            <label>ZipCode:</label> 
            <input type="text" class="form-control" id="zipcode" name="zipcode"
                value="<c:out value='${existingBranch.zipcode}' />" required="required" onchange="validateField('zipcode', this.value, /^\d{6}$/, 'ZipCode must be exactly 6 digits')">
            <div id="zipcodeError" style="color: red;"></div>
            </fieldset>
            <fieldset class="form-group">
            <label>Contact Number:</label> 
            <input type="number" class="form-control" id="branch_contact_number" name="branch_contact_number"
                value="<c:out value='${existingBranch.branch_contact_number}' />" required="required" onchange="validateField('branch_contact_number', this.value, /^[6-9]\d{9}$/, 'Please enter a valid 10-digit mobile number starting with 6-9')">
            <div id="branch_contact_numberError" style="color: red;"></div>
            </fieldset>
            <fieldset class="form-group">
            <label>Cost:</label> 
            <input type="number" class="form-control" id="amount" name="amount"
                value="<c:out value='${existingBranch.amount}' />" required="required" onchange="validateField('amount', this.value, /^[1-9]\d*$/, 'Cost must be a number greater than 0')">
            <div id="amountError" style="color: red;"></div>
            </fieldset>

            <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </div>
    </div>
</div>
<script>
    // Function to get query parameters
    function getQueryParam(param) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(param);
    }

    // Check if the "success" query parameter is present
    const success = getQueryParam('success');

    if (success === 'true') {
        alert('Branch updated successfully!..');
    } else if (success === 'false') {
        alert('Failed to update Branch. Please try again.');
    }

    function validateField(id, value, regex, errorMsg) {
        let errorElement = document.getElementById(id + 'Error');
        if (!value) {
            errorElement.textContent = "This field is required";
            return false;
        } else if (regex && !regex.test(value)) {
            errorElement.textContent = errorMsg;
            return false;
        } else {
            errorElement.textContent = "";
            return true;
        }
    }

    document.getElementById('branch_name').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('branch_name', value, /^[A-Za-z\s]{5,}$/, 'Branch Name must be at least 5 characters long and contain only letters');
    });

    document.getElementById('street').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('street', value, /^[A-Za-z0-9\s,]{5,}$/, 'Street must be at least 5 characters long and contain only letters and numbers');
    });

    document.getElementById('city').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('city', value, /^[A-Za-z\s]{5,}$/, 'City must be at least 5 characters long and contain only letters');
    });

    document.getElementById('state').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('state', value, /^[A-Za-z\s]{5,}$/, 'State must be at least 5 characters long and contain only letters');
    });

    document.getElementById('country').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('country', value, /^[A-Za-z\s]+$/, 'Country is required and must contain only letters');
    });

    document.getElementById('zipcode').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('zipcode', value, /^\d{6}$/, 'ZipCode must be exactly 6 digits');
    });

    document.getElementById('branch_contact_number').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('branch_contact_number', value, /^[6-9]\d{9}$/, 'Please enter a valid 10-digit mobile number starting with 6-9');
    });

    document.getElementById('amount').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('amount', value, /^[1-9]\d*$/, 'Cost must be a number greater than 0');
    });

</script>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
