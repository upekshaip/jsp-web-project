<%@page import="java.util.HashMap"%>
<%@page import="Config.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("user")) {
        response.sendRedirect("login.jsp?err=Please Login First");
        return;
    }

    String pageTitle = "My Orders";
    request.setAttribute("title", pageTitle);
    request.setAttribute("url", "./img/12.jpg");
    request.setAttribute("topic", "SEE YOUR ORDERS");
    request.setAttribute("description", "You can see all the products that you ordered.");
%>
<jsp:include page="./SiteParts/dash_header.jsp" />
<jsp:include page="./SiteParts/alerts.jsp" />   

<jsp:include page="./SiteParts/submenubar.jsp" />

<jsp:include page="./SiteParts/jambo.jsp" /> 

<%
    DB db = new DB();

    HashMap user = (HashMap) session.getAttribute("user");
    ResultSet rs = db.getOrders((String) user.get("id"));
%>


<section class="container p-0">
    <table class="table table-hover table-dark">
        <thead>
            <tr>
                <th scope="col">Order ID</th>
                <th scope="col">Product name</th>
                <th scope="col">Status</th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
                    int order_id = rs.getInt("orderId");
               
            %>
            <tr>
                <th>3</th>
                <td>Larry the Bird</td>
                <td>@twitter</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</section>

<jsp:include page="./SiteParts/dash_footer.jsp" />   