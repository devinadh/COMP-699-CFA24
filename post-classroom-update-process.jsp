<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<%@ page session="true" %>
<%
    // Get the session (no need to declare a new variable; use the implicitly available one)
    if (session == null || session.getAttribute("email") == null) {
        out.println("<p>Error: Session expired or not logged in. Please log in again.</p>");
        return;
    }

    // Retrieve the teacher's email from the session
    String teacherEmail = (String) session.getAttribute("email");
    String updateText = request.getParameter("updateText");

    if (updateText == null || updateText.trim().isEmpty()) {
        out.println("<p>Error: Update text is missing. Please provide an update.</p>");
        return;
    }

    Connection conn = null;
    PreparedStatement pst = null;

    try {
        // Database connection
        String dbURL = "jdbc:mysql://localhost:3306/teacher_communication_hub";
        String dbUser = "root";
        String dbPass = ""; // Update with your actual password if needed
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Insert the classroom update with the teacher's email
        String query = "INSERT INTO classroom_updates (update_text, teacher_email) VALUES (?, ?)";
        pst = conn.prepareStatement(query);
        pst.setString(1, updateText.trim());
        pst.setString(2, teacherEmail);

        int result = pst.executeUpdate();
        if (result > 0) {
            out.println("<p>Classroom update posted successfully!</p>");
            out.println("<a href='teacher-dashboard.jsp'>Back to Dashboard</a>");
        } else {
            out.println("<p>Error: Could not post the update. Please try again later.</p>");
        }

    } catch (SQLException e) {
        out.println("<p>Error: Database error occurred - " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
