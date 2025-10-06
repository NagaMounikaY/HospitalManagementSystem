<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Courier Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
    /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* About Section */
.about {
    background: #f9f9f9;
    padding: 60px 20px;
    margin-top: 60px; /* Offset for fixed header */
}

.about .container {
    max-width: 1200px;
    margin: 0 auto;
}

.about h1 {
    text-align: center;
    margin-bottom: 40px;
    font-size: 2.5em;
    color: #333;
}

.about-content {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: space-between;
}

.about-text {
    flex: 1;
    padding: 20px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.about-text h2 {
    margin-bottom: 20px;
    font-size: 2em;
    color: #007BFF;
}

.about-text p {
    margin-bottom: 20px;
    color: #666;
}

.about-image img {
    width: 100%;
    max-width: 100%;
    height: auto;
    border-radius: 8px;
}

.about-mission {
    text-align: center;
    margin-top: 40px;
}

.about-mission h2 {
    font-size: 2em;
    color: #007BFF;
    margin-bottom: 20px;
}

.about-mission p {
    color: #666;
    font-size: 1.2em;
}

/* Responsive Design */
@media (max-width: 768px) {
    .about-content {
        flex-direction: column;
        align-items: center;
    }

    .about-text, .about-image {
        width: 100%;
    }
}
    
    </style>
</head>
<body>
    <!-- Header Section -->
   <jsp:include page="../common/header.jsp"></jsp:include>

   <!-- About Section -->
<section id="about" class="about">
    <div class="container">
        <h1>About Us</h1>
        <div class="about-content">
            <div class="about-text">
                <h2>Welcome to Our Hospital Management</h2>
                <p>Our Hospital Management System is designed to make healthcare smarter, faster, and more accessible. 
                   It streamlines patient registration, appointment scheduling, doctor-patient interaction, and medical records management all in one place.</p>
                
                <p>With digital prescriptions, online consultations, real-time reports, and secure data management, 
                   our platform bridges the gap between doctors and patients, ensuring high-quality healthcare delivery.</p>
                
                <p>We aim to empower hospitals, clinics, and healthcare providers with advanced tools to improve efficiency, 
                   enhance patient satisfaction, and ensure timely treatment.</p>
            </div>
            <div class="about-image">
                <img src="https://tse3.mm.bing.net/th/id/OIP.MaxN-wBx66pm61RZJnQwBAHaDt?rs=1&pid=ImgDetMain&o=7&rm=3" alt="Hospital Management System">
            </div>
        </div>

        <div class="about-mission">
            <h2>Our Mission</h2>
            <p>Our mission is to revolutionize healthcare through innovation and technology. 
               We strive to create a patient-centered environment where doctors, nurses, and staff can 
               focus more on care while the system takes care of administration and efficiency.</p>
        </div>
    </div>
</section>

<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
