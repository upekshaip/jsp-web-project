<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageTitle = "Index";
    request.setAttribute("title", pageTitle);
%>
<jsp:include page="./SiteParts/dash_header.jsp" />
<jsp:include page="./SiteParts/alerts.jsp" />   

<%
    String role = (String) session.getAttribute("role");
    if (role != null) { %>    
<jsp:include page="./SiteParts/submenubar.jsp" />
<%  }%>



<jsp:include page="./SiteParts/dash_footer.jsp" />   