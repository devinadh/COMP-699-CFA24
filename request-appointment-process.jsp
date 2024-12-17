<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<%
    String parentEmail = (String) session.getAttribute("email");
    String teacherEmail = request.getParameter("teacherEmail");
    String appointmentDate = request.getParameter("appointmentDate");
    String contactNumber = request.getParameter("contactNumber");

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        String dbURL = "jdbc:mysql://localhost:3306/teacher_communication_hub";
        String dbUser = "root";
        String dbPass = "";
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        String query = "SELECT user_id FROM users WHERE email = ?";
        pst = conn.prepareStatement(query);
        pst.setString(1, teacherEmail);
        rs = pst.executeQuery();

        if (rs.next()) {
            int teacherId = rs.getInt("user_id");

            query = "INSERT INTO appointments (parent_email, teacher_id, appointment_date, contact_number, status) VALUES (?, ?, ?, ?, 'Pending')";
            pst = conn.prepareStatement(query);
            pst.setString(1, parentEmail);
            pst.setInt(2, teacherId);
            pst.setString(3, appointmentDate);
            pst.setString(4, contactNumber);

            int result = pst.executeUpdate();
            if (result > 0) {
                out.println("<p>Your appointment request has been submitted successfully. Waiting for approval.</p>");
            } else {
                out.println("<p>Error requesting appointment. Please try again.</p>");
            }
        } else {
            out.println("<p>Teacher not found. Please check the email address and try again.</p>");
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
