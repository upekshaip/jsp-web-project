<section class="defalt-container-style text-white d-flex justify-content-between align-items-center container">
    <div class="">
        <h4 style="margin:0; text-transform: uppercase;">
            Welcome
        </h4>
    </div>
    <div>
        <%
        String role = (String) session.getAttribute("role");
        if (role != null && role.equals("admin")) {
            %>
            <a href="./admin.jsp" class="btn btn-success">Admin Panel</a>
            <%
        }
        %>
        <a href="./orders.jsp" class="btn btn-warning ml-3">My Orders</a>

        <a href="./cart.jsp" class="btn btn-primary">
            My Cart <span class="badge text-bg-light">4</span>
        </a>
    </div>
</section>