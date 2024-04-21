<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("user")) {
        response.sendRedirect("index.jsp");
        return;
    }

    String pageTitle = "My Cart";
    request.setAttribute("title", pageTitle);
    HashMap<Integer, HashMap<String, Object>> cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");
%>
<jsp:include page="./SiteParts/dash_header.jsp" />
<jsp:include page="./SiteParts/alerts.jsp" />   

<%
    if (role != null) {
%>    
<jsp:include page="./SiteParts/submenubar.jsp" />
<%  }%>
<style>
    .square-container {
        width: 50px; /* Set width of the container */
        height: 50px; /* Set height of the container */
        overflow: hidden; /* Hide overflowing content */
    }

    .square-image {
        width: auto; /* Set width to fill container */
        height: 100%; /* Allow height to adjust proportionally */
        object-fit: cover; /* Crop image to cover container */
    }
</style>
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-8">
            <h2>Shopping Cart</h2>
            <table class="table table-dark table-hover">
                <thead>
                    <tr>
                        <th scope="col">Product</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col" class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody style="vertical-align: middle;">

                    <%
                        if (cart.size() > 0) {
                            for (int key : cart.keySet()) {
                                HashMap value = cart.get(key);
                    %>

                    <tr>
                        <td>
                            <div class="square-container">
                                <img class="square-image" src="<%=value.get("photo")%>" alt="...">
                            </div>
                        </td>
                        <td><%=value.get("name")%></td>
                        <td>
                            <div>
                                <%
                                    if (!value.get("price").equals(value.get("old_price"))) {
                                %>
                                <s><p class="discount-price m-0"><%=value.get("old_price")%> LKR</p></s>
                                    <%
                                        }
                                    %>
                                <p class="m-0"><%=value.get("price")%> LKR</p>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex justify-content-between align-items-center">
                                <button style="width: 35%;" type="button" class="btn btn-sm btn-outline-warning">-</button>
                                <span class="badge text-bg-warning"><%=value.get("items") %></span>
                                <button style="width: 35%;" type="button" class="btn btn-sm btn-outline-warning">+</button>
                            </div>
                            <form method="post" action="RemoveItem" class="mt-2 d-flex justify-content-center align-items-center">
                                <input type="hidden" name="id" value="<%=value.get("id") %>">
                                <button type="submit" style="width: 100%;" class="btn btn-sm btn-outline-danger">Remove</button>                                
                            </form>
                        </td>

                    </tr>
                    <%
                            }
                        }
                    %>

                </tbody>
            </table>
        </div>
        <div class="col-lg-4">
            <h2>Summary</h2>
            <div class="bg-dark">
                <div class="card-body">
                    <p>Total Items: 3</p>
                    <p>Total Price: $40</p>
                    <button class="btn btn-primary">Checkout</button>
                </div>
            </div>
        </div>
    </div>
</div>



<jsp:include page="./SiteParts/dash_footer.jsp" />   