<%@page import="Config.Functions"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    out.println(role);
    if (role == null || !role.equals("user")) {
        response.sendRedirect("index.jsp");
    }
    
    String pageTitle = "My Profile";
    request.setAttribute("title", pageTitle);
    

%>
<jsp:include page="./SiteParts/dash_footer.jsp" />   