<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageTitle = "Index";
    request.setAttribute("title", pageTitle);
%>
<jsp:include page="./SiteParts/dash_header.jsp" />
<jsp:include page="./SiteParts/alerts.jsp" />   


<h1 class="text-center">Index</h1>

        
<!--body-->

 
 <jsp:include page="./SiteParts/dash_footer.jsp" />   