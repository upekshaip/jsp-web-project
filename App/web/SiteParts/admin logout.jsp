<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Logout</title>
</head>
<body>
    <% 
        HttpSession session = request.getSession(false); // Retrieve the session without creating a new one if it doesn't exist

        if (session != null) {
            session.invalidate(); // Invalidate the session, effectively logging out the admin
            response.sendRedirect("home.jsp"); // Redirect to home page
        } else {
            // If session doesn't exist, display a message
            out.println("<p>Session does not exist. You are already logged out.</p>");
            out.println("<a href=\"adminLogin.jsp\">Back to Admin Login</a>");
        }
    %>
</body>
</html>
