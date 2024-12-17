<%@ page session="true" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Welcome, Parent!</h1>
        <nav>
            <ul>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <section class="main-content">
        <h3>Manage Your Child's Information</h3>
        <ul>
            <li><a href="view-grades.jsp">View Grades</a></li>
            <li><a href="request-appointment.jsp">Request Appointment</a></li>
            <li><a href="view-classroom-updates.jsp">View Classroom Updates</a></li>
        </ul>
    </section>

    <footer>
        <p>&copy; 2024 Teacher Communication Hub. All rights reserved.</p>
    </footer>
</body>
</html>
