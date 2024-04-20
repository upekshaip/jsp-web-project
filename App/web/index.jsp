<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageTitle = "Home";
    request.setAttribute("title", pageTitle);
%>
<jsp:include page="./SiteParts/header.jsp" />


<h1 class="text-center my-5">Index</h1>

 <jsp:include page="./SiteParts/alerts.jsp" />   
        
<!--body-->

 
 <jsp:include page="./SiteParts/footer.jsp" />   