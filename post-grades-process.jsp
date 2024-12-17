<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<%
    String teacherEmail = (String) session.getAttribute("email");
    String studentEmail = request.getParameter("studentEmail");
    String subject = request.getParameter("subject");
    String grade = request.getParameter("grade");

    Connection conn = null;
    PreparedStatement pst = null;

    try {
        String dbURL = "jdbc:mysql://localhost:3306/teacher_communication_hub";
        String dbUser = "root";
        String dbPass = "";
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        String query = "SELECT user_id FROM users WHERE email = ?";
        pst = conn.prepareStatement(query);
        pst.setString(1, teacherEmail);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            int teacherId = rs.getInt("user_id");

            query = "INSERT INTO grades (student_email, subject, grade, teacher_id) VALUES (?, ?, ?, ?)";
            pst = conn.prepareStatement(query);
            pst.setString(1, studentEmail);
            pst.setString(2, subject);
            pst.setString(3, grade);
            pst.setInt(4, teacherId);

            int result = pst.executeUpdate();
            if (result > 0) {
                out.println("<p>Grade posted successfully!</p>");
            } else {
                out.println("<p>Error posting grade. Please try again.</p>");
            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
