<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Appointment</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Request Appointment with Teacher</h1>
        <nav>
            <ul>
                <li><a href="parent-dashboard.jsp">Dashboard</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="view-grades.jsp">View Grades</a></li>
                <li><a href="view-classroom-updates.jsp">View Classroom Updates</a></li>
            </ul>
        </nav>
    </header>

    <section>
        <h2>Appointment Request</h2>
        <form action="request-appointment-process.jsp" method="post">
            <label for="teacherId">Teacher Email:</label>
            <input type="email" name="teacherEmail" required /><br>

            <label for="appointmentDate">Appointment Date:</label>
            <input type="datetime-local" name="appointmentDate" required /><br>

            <label for="contactNumber">Contact Number:</label>
            <input type="text" name="contactNumber" required /><br>

            <input type="submit" value="Request Appointment" />
        </form>
    </section>

    <footer>
        <p>&copy; 2024 Teacher Communication Hub. All rights reserved.</p>
    </footer>
</body>
</html>
