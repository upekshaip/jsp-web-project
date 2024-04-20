<%  
    String ok = request.getParameter("ok");
    String err = request.getParameter("err");
    if (err != null) { %>
    <div class="container alert alert-danger alert-dismissible fade show text-center" role="alert">
        <strong>Warning!</strong> <%=err%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% }
    if (ok != null) { %>
    <div class="container alert alert-success alert-dismissible fade show text-center" role="alert">
        <strong>Looking Good!</strong> <%=ok%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>