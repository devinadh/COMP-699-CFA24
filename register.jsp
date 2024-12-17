<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Teacher Communication Hub</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Register - Teacher Communication Hub</h1>
    </header>

    <section class="register">
        <h2>Register</h2>
        <form action="register-process.jsp" method="post">
            <label for="name">Full Name:</label>
            <input type="text" name="name" required><br><br>

            <label for="email">Email:</label>
            <input type="email" name="email" required><br><br>

            <label for="password">Password:</label>
            <input type="password" name="password" required><br><br>

            <label for="role">Role:</label>
            <select name="role" required>
                <option value="parent">Parent</option>
                <option value="teacher">Teacher</option>
            </select><br><br>

            <button type="submit">Register</button>
        </form>
    </section>

    <footer>
        <p>&copy; 2024 Teacher Communication Hub. All rights reserved.</p>
    </footer>
</body>
</html>
