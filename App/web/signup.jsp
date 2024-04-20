<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="./SiteParts/header.jsp" />


<h1 class="text-center my-5">Sign Up</h1>
 <jsp:include page="./SiteParts/alerts.jsp" />   
        
        
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
 
 <jsp:include page="./SiteParts/footer.jsp" />   