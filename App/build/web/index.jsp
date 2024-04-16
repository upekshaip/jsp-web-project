<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1 class="text-center my-5">Sign Up</h1>
        
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
        
        
    <div class="container">
        <form class="row g-3 needs-validation" method="post" action="SignupServlet" novalidate>
      <div class="col-md-6">
        <label  class="form-label">Username</label>
        <input type="text" class="form-control" required name="username">
      </div>
      <div class="col-md-6">
        <label  class="form-label">Email</label>
        <input type="email" class="form-control" required name="email">
      </div>
      <div class="col-md-6">
        <label  class="form-label">Password</label>
        <input type="password" class="form-control" required name="password">
      </div>
      <div class="col-md-6">
        <label  class="form-label">Repeat Password</label>
        <input type="password" class="form-control" required name="password_rep">
      </div>

    <button class="btn btn-primary col-12 mx-2 mt-5" type="submit">Sign Up</button>
    </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>