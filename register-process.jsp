<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    Connection conn = null;
    PreparedStatement ps = null;
    try {
        // Update the connection details for your project
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teacher_communication_hub", "root", "");
        String query = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
        ps = conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.setString(4, role);

        int result = ps.executeUpdate();
        if (result > 0) {
            out.println("Registration successful. <a href='login.jsp'>Login</a>");
        } else {
            out.println("Registration failed.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
