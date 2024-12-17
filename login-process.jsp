<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*, javax.servlet.http.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Update the connection details for your project
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teacher_communication_hub", "root", "");

        String query = "SELECT * FROM users WHERE email = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, email);

        rs = ps.executeQuery();
        if (rs.next()) {
            // Retrieve the stored password hash
            String storedPassword = rs.getString("password");
            String role = rs.getString("role");

            // If you're using plain text password, replace this with hashed password comparison
            if (password.equals(storedPassword)) { // In real applications, hash comparison should be done
                // Accessing session directly without declaring a new variable
                request.getSession(true).setAttribute("email", email);
                request.getSession().setAttribute("role", role);

                // Redirect based on user role
                if ("teacher".equals(role)) {
                    response.sendRedirect("teacher-dashboard.jsp");
                } else if ("parent".equals(role)) {
                    response.sendRedirect("parent-dashboard.jsp");
                }
            } else {
                out.println("<p>Invalid login credentials. Please try again.</p>");
            }
        } else {
            out.println("<p>User not found. Please check your email.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>An error occurred: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
