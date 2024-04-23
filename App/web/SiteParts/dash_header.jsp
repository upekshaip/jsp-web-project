<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= request.getAttribute("title")%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/colors.css">
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark" style="background-color: var(--navbar-color) !important;">
            <div class="container-fluid">
                <a class="navbar-brand d-flex justify-center align-items-center" href="./index.jsp">
                    <img src="./img/WristWise.png" width="50" height="50" class="d-inline-block align-top" alt="">WristWise</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="./index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./products.jsp">Products</a>
                        </li>
                        <%
                        if (session != null && (session.getAttribute("role") != null) ){
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="./orders.jsp">Orders</a>
                        </li>
                        <% } %>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                    </ul>
                    <%
                        HttpSession mySession = request.getSession(false);
                        String role = (String) mySession.getAttribute("role");
                        String username = (String) mySession.getAttribute("username");
                        
                        if (username != null && role != null && (role.equals("user") || role.equals("admin"))) {
                    %>
                    <form class="d-flex" method="post" action="LogoutServlet">
                        <a href="profile.jsp" class="btn btn-warning me-2">My Profile</a>
                        <button class="btn btn-outline-danger" type="submit">Log Out</button>
                    </form>                 
                    <%
                    } else {
                    %>
                    <form class="d-flex" method="post">
                        <a href="signup.jsp" class="btn btn-warning me-2">Sign Up</a>
                        <a href="login.jsp" class="btn btn-outline-light">Log In</a>
                    </form>                 
                    <%
                        }
                    %>

                </div>
            </div>
        </nav>