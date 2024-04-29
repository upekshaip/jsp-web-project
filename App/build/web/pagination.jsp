<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products Page</title>
</head>
<body>
    <h1>Products</h1>
    
    <% List<String> productList = new ArrayList<>(); %>
    <% for (int i = 1; i <= 50; i++) {
        productList.add("Product " + i);
    } %>
    
    <%-- Pagination parameters --%>
    <% int pageSize = 10; %>
    <% int page = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1; %>
    <% int totalPages = (int) Math.ceil((double) productList.size() / pageSize); %>
    <% int start = (page - 1) * pageSize; %>
    <% int end = Math.min(start + pageSize, productList.size()); %>
    
    <%-- Display products for the current page --%>
    <ul>
        <% for (int i = start; i < end; i++) { %>
            <li><%= productList.get(i) %></li>
        <% } %>
    </ul>
    
    <%-- Pagination links --%>
    <% if (totalPages > 1) { %>
        <div>
            <% if (page > 1) { %>
                <a href="products.jsp?page=<%= page - 1 %>">Previous</a>
            <% } %>
            
            <% for (int i = 1; i <= totalPages; i++) { %>
                <% if (i == page) { %>
                    <%= i %>
                <% } else { %>
                    <a href="products.jsp?page=<%= i %>"><%= i %></a>
                <% } %>
            <% } %>
            
            <% if (page < totalPages) { %>
                <a href="products.jsp?page=<%= page + 1 %>">Next</a>
            <% } %>
        </div>
    <% } %>
</body>
</html>
