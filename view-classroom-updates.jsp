<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classroom Updates</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Classroom Updates</h1>
        <nav>
            <ul>
                <li><a href="parent-dashboard.jsp">Dashboard</a></li> <!-- Link to Parent Dashboard -->
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <section>
        <h2>Latest Updates from Teachers</h2>

        <%
            Connection conn = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3306/teacher_communication_hub";
                String dbUser = "root"; // Replace with your database username
                String dbPass = ""; // Replace with your database password
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // Query to get all classroom updates
                String query = "SELECT u.name, cu.update_text, cu.update_id FROM classroom_updates cu " +
                               "JOIN users u ON cu.teacher_id = u.user_id ORDER BY cu.update_id DESC";
                pst = conn.prepareStatement(query);
                rs = pst.executeQuery();

                if (rs.next()) {
        %>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Teacher</th>
                                <th>Update</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Loop through all the classroom updates and display them
                                do {
                                    String teacherName = rs.getString("name");
                                    String updateText = rs.getString("update_text");
                                    String updateDate = rs.getString("update_id"); // You can format the date properly
                            %>
                            <tr>
                                <td><%= teacherName %></td>
                                <td><%= updateText %></td>
                                <td><%= updateDate %></td>
                            </tr>
                            <%
                                } while (rs.next());
                            %>
                        </tbody>
                    </table>
                <%
                } else {
                    out.println("<p>No updates available.</p>");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
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

    </section>

    <footer>
        <p>&copy; 2024 Teacher Communication Hub. All rights reserved.</p>
    </footer>
</body>
</html>
