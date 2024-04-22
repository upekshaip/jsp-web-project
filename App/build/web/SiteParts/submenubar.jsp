<%@page import="java.util.HashMap"%>

<%
    HashMap<Integer, HashMap<String, Object>> cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");
    int cart_size = 0;
    if (cart.size() > 0) {
        for (int key : cart.keySet()) {
        HashMap value = cart.get(key);
        cart_size += (int) value.get("items");
        }
    }
%>

<section class="defalt-container-style text-white d-flex justify-content-between align-items-center container">
    <div class="">
        <h4 style="margin:0; text-transform: uppercase;">
            Welcome
        </h4>
    </div>
    <div>
        <%            String role = (String) session.getAttribute("role");
            if (role != null && role.equals("admin")) {
        %>
        <a href="./admin.jsp" class="btn btn-success">Admin Panel</a>
        <%
            }
        %>
        <a href="./orders.jsp" class="btn btn-warning ml-3">My Orders</a>

        <a href="./cart.jsp" class="btn btn-primary">
            My Cart <span id="cart_number" class="badge text-bg-light"><%=cart_size%></span>
        </a>
    </div>
</section>