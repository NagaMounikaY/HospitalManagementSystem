<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME PAGE</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
  /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Features Section */
.features {
    background: #483D8B; /* Background color or image */
    padding: 60px 20px;
}

.features .container {
    max-width: 1200px;
    margin: 0 auto;
}

.features h2 {
    text-align: center;
    margin-bottom: 40px;
}

.features-content {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.feature {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    padding: 20px;
    width: calc(25% - 20px); /* Adjust width as needed */
    text-align: center;
    margin-bottom: 20px;
    transition: transform 0.3s;
}

.feature i {
    font-size: 4em; /* Increase size */
    color: #007BFF; /* Apply color */
    margin-bottom: 10px;
    transition: color 0.3s; /* Smooth transition for hover effect */
}

.feature:hover {
    transform: scale(1.05);
}

.feature i:hover {
    color: #0056b3; /* Change color on hover */
}

/* Responsive Design */
@media (max-width: 1200px) {
    .feature {
        width: calc(33.333% - 20px); /* Adjust for three per row */
    }
}

@media (max-width: 768px) {
    .feature {
        width: calc(50% - 20px); /* Adjust for two per row */
    }
}

@media (max-width: 480px) {
    .feature {
        width: 100%; /* Adjust for one per row */
    }
}

@media (max-width: 768px) {
    .background-section {
        background-image: url('path/to/mobile-image.jpg'); /* Change image for smaller screens */
    }
}

/* Hero Section */

.hero {
    background: url('https://tse2.mm.bing.net/th/id/OIP.kIgCTR_TF1Ux-MlR6pw0AgHaEK?rs=1&pid=ImgDetMain&o=7&rm=3') no-repeat center center/cover;
    color: #fff;
    padding: 100px 20px;
    text-align: center;
    margin-top: 60px; /* Adjusted to account for fixed header */
}

.hero h1 {
    font-size: 2.5em;
    margin-bottom: 20px;
}

.hero p {
    font-size: 1.2em;
    margin-bottom: 30px;
}

.btn {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    margin: 0 10px;
}

.btn.primary {
    background: #00008B;
}

.btn.secondary {
    background: #00008B;
}


    
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
        <font class="" size="4">
    <marquee><b><i>Welcome To Hospital Management System</i></b></marquee>
    </font>
            <h1>Efficient Appointment Booking, Anytime, Anywhere</h1>
            <p>Streamline your shipping with our easy-to-use online system.</p>
            <a href="<%= request.getContextPath() %>/register"  class="btn secondary">Register</a>
            <a href="<%= request.getContextPath() %>/About/about.jsp" class="btn secondary">Learn More</a>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
        </div>
    </section>

   <!-- Features Section -->
<section class="features">
    <div class="container">
        <h2>Why Choose Our Hospital?</h2>
        <div class="feature-cards">

            <div class="feature-card">
                <img src="https://cdn-icons-png.flaticon.com/512/2966/2966481.png" alt="Qualified Doctors">
                <h3>Qualified Doctors</h3>
                <p>Our team consists of highly experienced and specialized doctors to provide the best care.</p>
            </div>

            <div class="feature-card">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="24/7 Emergency Care">
                <h3>24/7 Emergency Care</h3>
                <p>Round-the-clock emergency services to handle critical medical situations anytime.</p>
            </div>

            <div class="feature-card">
                <img src="https://cdn-icons-png.flaticon.com/512/2991/2991148.png" alt="Advanced Technology">
                <h3>Advanced Technology</h3>
                <p>We use state-of-the-art equipment and modern facilities for accurate diagnosis and treatment.</p>
            </div>

            <div class="feature-card">
                <img src="https://cdn-icons-png.flaticon.com/512/2966/2966500.png" alt="Patient-Centered Care">
                <h3>Patient-Centered Care</h3>
                <p>Compassionate care tailored to meet the individual needs of every patient.</p>
            </div>

        </div>
    </div>
</section>

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
