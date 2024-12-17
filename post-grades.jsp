<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Grades</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Post Grades</h1>
        <nav>
            <ul>
                <li><a href="teacher-dashboard.jsp">Dashboard</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="post-classroom-update.jsp">Post Classroom Update</a></li>
                <li><a href="view-appointments.jsp">View Appointments</a></li>
            </ul>
        </nav>
    </header>

    <section>
        <h2>Post a Grade</h2>
        <form action="post-grades-process.jsp" method="post">
            <label for="studentEmail">Student Email:</label>
            <input type="email" name="studentEmail" required /><br>

            <label for="subject">Subject:</label>
            <input type="text" name="subject" required /><br>

            <label for="grade">Grade:</label>
            <input type="text" name="grade" required /><br>

            <input type="submit" value="Post Grade" />
        </form>
    </section>

    <footer>
        <p>&copy; 2024 Teacher Communication Hub. All rights reserved.</p>
    </footer>
</body>
</html>
