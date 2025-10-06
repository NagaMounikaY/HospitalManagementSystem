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

    function validatePassword(password) {
        return {
            lengthValid: password.length >= 6,
            containsDigit: /[0-9]/.test(password),
            containsUpper: /[A-Z]/.test(password),
            containsLower: /[a-z]/.test(password)
        };
    }

    document.getElementById('firstName').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('firstName', value, /^[A-Za-z]{4,}$/, "First Name must be at least 4 letters long and contain only letters");
    });

    document.getElementById('lastName').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('lastName', value, /^[A-Za-z]+$/, "Last Name should contain only letters");
    });

    document.getElementById('mobile').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('mobile', value, /^[6-9]\d{9}$/, "Please enter a valid 10-digit mobile number starting with 6-9");
    });

    document.getElementById('email').addEventListener('input', function() {
        let value = this.value.trim();
        validateField('email', value, /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/, "Enter a valid email address");
    });


    document.getElementById('password').addEventListener('input', function() {
        let value = this.value;
        let validation = validatePassword(value);
        let errorElement = document.getElementById('passwordError');

        if (!value) {
            errorElement.textContent = "Please enter a password";
        } else if (!validation.lengthValid) {
            errorElement.textContent = "Password must be at least 6 characters long";
        } else if (!validation.containsDigit) {
            errorElement.textContent = "Password must include at least one digit";
        } else if (!validation.containsUpper) {
            errorElement.textContent = "Password must include at least one uppercase letter";
        } else if (!validation.containsLower) {
            errorElement.textContent = "Password must include at least one lowercase letter";
        } else {
            errorElement.textContent = "";
        }
    });

    document.getElementById('confirmPassword').addEventListener('input', function() {
        let password = document.getElementById('password').value;
        let confirmPassword = this.value;
        let errorElement = document.getElementById('confirmPasswordError');

        if (!confirmPassword) {
            errorElement.textContent = "Please confirm your password";
        } else if (password !== confirmPassword) {
            errorElement.textContent = "Passwords do not match";
        } else {
            errorElement.textContent = "";
        }
    });

    document.getElementById('signupForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the form from submitting immediately

        // Check all fields
        let firstName = document.getElementById('firstName').value.trim();
        let lastName = document.getElementById('lastName').value.trim();
        let mobile = document.getElementById('mobile').value.trim();
        let email = document.getElementById('email').value.trim();
        let password = document.getElementById('password').value;
        let confirmPassword = document.getElementById('confirmPassword').value;

        let isValid = true;
        isValid = validateField('firstName', firstName, /^[A-Za-z]{4,}$/, "First Name must be at least 4 letters long and contain only letters");
        isValid = validateField('lastName', lastName, /^[A-Za-z]+$/, "Last Name should contain only letters");
        isValid = validateField('mobile', mobile, /^[6-9]\d{9}$/, "Please enter a valid 10-digit mobile number starting with 6-9");
        isValid = validateField('email', email, /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/, "Enter a valid email address");

        let passwordValidation = validatePassword(password);
        let passwordError = document.getElementById('passwordError');
        if (!password) {
            passwordError.textContent = "Please enter a password";
            isValid = false;
        } else if (!passwordValidation.lengthValid) {
            passwordError.textContent = "Password must be at least 6 characters long";
            isValid = false;
        } else if (!passwordValidation.containsDigit) {
            passwordError.textContent = "Password must include at least one digit";
            isValid = false;
        } else if (!passwordValidation.containsUpper) {
            passwordError.textContent = "Password must include at least one uppercase letter";
            isValid = false;
        } else if (!passwordValidation.containsLower) {
            passwordError.textContent = "Password must include at least one lowercase letter";
            isValid = false;
        } else {
            passwordError.textContent = "";
        }

        let confirmPasswordError = document.getElementById('confirmPasswordError');
        if (!confirmPassword) {
            confirmPasswordError.textContent = "Please confirm your password";
            isValid = false;
        } else if (password !== confirmPassword) {
            confirmPasswordError.textContent = "Passwords do not match";
            isValid = false;
        } else {
            confirmPasswordError.textContent = "";
        }

        if (isValid) {
            alert('Form submitted successfully!');
            // You can now submit the form programmatically if needed
             this.submit();
        }
    });