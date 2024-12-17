<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Grades</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Your Child's Grades</h1>
        <nav>
            <ul>
                <li><a href="parent-dashboard.jsp">Dashboard</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="view-appointments.jsp">View Appointments</a></li>
                <li><a href="view-classroom-updates.jsp">View Classroom Updates</a></li>
            </ul>
        </nav>
    </header>

    <section>
        <h2>Grades</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Subject</th>
                    <th>Grade</th>
                    <th>Teacher</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    String parentEmail = (String) session.getAttribute("email");
                    Connection conn = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;
                    try {
                        String dbURL = "jdbc:mysql://localhost:3306/teacher_communication_hub";
                        String dbUser = "root";
                        String dbPass = "";
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                        String query = "SELECT g.subject, g.grade, u.name FROM grades g JOIN users u ON g.teacher_id = u.user_id WHERE g.student_email = ?";
                        pst = conn.prepareStatement(query);
                        pst.setString(1, parentEmail);
                        rs = pst.executeQuery();

                        while (rs.next()) {
                            String subject = rs.getString("subject");
                            String grade = rs.getString("grade");
                            String teacher = rs.getString("name");
                %>
                <tr>
                    <td><%= subject %></td>
                    <td><%= grade %></td>
                    <td><%= teacher %></td>
                </tr>
                <% 
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<p>Error fetching grades: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pst != null) pst.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </section>

    <footer>
        <p>&copy; 2024 Teacher Communication Hub. All rights reserved.</p>
    </footer>
</body>
</html>
