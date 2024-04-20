<%  
    String ok = request.getParameter("ok");
    String err = request.getParameter("err");
    if (err != null) { %>
    <div style="background-color: rgba(255,0,0,.2); border: 1px solid red;" class="mt-3 text-white container alert alert-danger alert-dismissible fade show text-center" role="alert">
        <strong>Warning!</strong> <%=err%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% }
    if (ok != null) { %>
    <div style="background-color: rgba(0,255,0,.2); border: 1px solid green;" class="mt-3 text-white container alert alert-success alert-dismissible fade show text-center" role="alert">
        <strong>Looking Good!</strong> <%=ok%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>