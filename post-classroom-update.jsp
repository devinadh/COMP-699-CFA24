<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Classroom Update</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Post Classroom Update</h1>
        <nav>
            <ul>
                <li><a href="teacher-dashboard.jsp">Dashboard</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="view-appointments.jsp">View Appointments</a></li>
                <li><a href="view-classroom-updates.jsp">View Classroom Updates</a></li>
            </ul>
        </nav>
    </header>

    <section>
        <h2>Post an Update</h2>
        <form action="post-classroom-update-process.jsp" method="post">
            <label for="updateText">Update:</label>
            <textarea id="updateText" name="updateText" rows="5" required></textarea><br>
            <input type="submit" value="Post Update">
        </form>
    </section>

    <footer>
        <p>&copy; 2024 Teacher Communication Hub. All rights reserved.</p>
    </footer>
</body>
</html>
