<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Requested Appointments</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Requested Appointments</h1>
        <nav>
            <ul>
                <li><a href="teacher-dashboard.jsp">Dashboard</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="post-classroom-update.jsp">Post Classroom Update</a></li>
            </ul>
        </nav>
    </header>

    <section>
        <h2>Requested Appointments</h2>
        <table>
            <thead>
                <tr>
                    <th>Parent Email</th>
                    <th>Appointment Date</th>
                    <th>Contact Number</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Database connection variables
                    Connection conn = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;

                    try {
                        // Establish connection to the database
                        String dbURL = "jdbc:mysql://localhost:3306/teacher_communication_hub";
                        String dbUser = "root";
                        String dbPass = "";
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                        // Retrieve the logged-in teacher's email from the session
                        String teacherEmail = (String) session.getAttribute("email");

                        // Query to get teacher's user_id
                        String query = "SELECT user_id FROM users WHERE email = ?";
                        pst = conn.prepareStatement(query);
                        pst.setString(1, teacherEmail);
                        rs = pst.executeQuery();

                        if (rs.next()) {
                            int teacherId = rs.getInt("user_id");

                            // Query to get the appointments for the teacher
                            query = "SELECT * FROM appointments WHERE teacher_id = ?";
                            pst = conn.prepareStatement(query);
                            pst.setInt(1, teacherId);
                            rs = pst.executeQuery();

                            // Loop through and display the appointments
                            while (rs.next()) {
                                String parentEmail = rs.getString("parent_email");
                                String appointmentDate = rs.getString("appointment_date");
                                String contactNumber = rs.getString("contact_number");
                                String status = rs.getString("status");
                %>
                                <tr>
                                    <td><%= parentEmail %></td>
                                    <td><%= appointmentDate %></td>
                                    <td><%= contactNumber %></td>
                                    <td><%= status %></td>
                                </tr>
                <%
                            }
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        // Clean up the database connections
                        try {
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
