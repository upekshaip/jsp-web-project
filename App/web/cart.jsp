<%@page import="Config.Config"%>
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
<%
    int cart_items = 0;
    float full_price = 0;
    float total_discount = 0;
    float final_price = 0;
%>


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

                                cart_items += (int) value.get("items");
                                total_discount += (((float) value.get("old_price") - (float) value.get("price")) * (int) value.get("items"));
                                full_price += ((float) value.get("old_price") * (int) value.get("items"));
                                final_price += ((float) value.get("price") * (int) value.get("items"));

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
                                <s><p class="discount-price m-0 text-start"><%=String.format("%.2f", value.get("old_price"))%> LKR</p></s>
                                    <%
                                        }
                                    %>
                                <p class="m-0 text-start"><%=String.format("%.2f", value.get("price"))%> LKR</p>
                                <input type="hidden" class="current_price" value="<%=value.get("price")%>">
                                <input type="hidden" class="old_price" value="<%=value.get("old_price")%>">
                                <input type="hidden" class="item_id" value="<%=value.get("id")%>">
                                <input type="hidden" class="quantity" id="quantity_in_<%=value.get("id")%>" value="<%=value.get("items")%>">
                            </div>
                        </td>
                        <td>
                            <div class="d-flex justify-content-between align-items-center">
                                <button style="width: 35%;" type="button" class="btn btn-sm btn-outline-warning" onclick="changeAmount('<%=value.get("id")%>', 'dec')">-</button>
                                <span id="quantity_<%=value.get("id")%>" class="badge text-bg-warning"><%=value.get("items")%></span>
                                <button style="width: 35%;" type="button" class="btn btn-sm btn-outline-warning" onclick="changeAmount('<%=value.get("id")%>', 'inc')">+</button>
                            </div>
                            <form method="post" action="RemoveItem" class="mt-2 d-flex justify-content-center align-items-center">
                                <input type="hidden" name="id" value="<%=value.get("id")%>">
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
                    <div class="d-flex justify-content-between align-items-center">
                        <p>Total Items: </p>
                        <p><b class="text-end" id="total_items"><%=cart_items%></b></p>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p>Total Price: </p>
                        <p><b class="text-end" id="total_price"><%=String.format("%.2f", full_price)%> LKR</b></p>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p>Total Discount: </p>
                        <p><b class="text-end" id="total_discount"><%=String.format("%.2f", total_discount)%> LKR</b></p>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p>Final Price: </p>
                        <p><b class="text-end" id="final_price"><%=String.format("%.2f", final_price)%> LKR</b></p>
                    </div>
                    <form>
                        <%
                            if (cart.size() > 0) {
                                for (int key : cart.keySet()) {
                                    HashMap value = cart.get(key);
                        %>
                        <input type="hidden" name="id_<%=value.get("id")%>" value="1">
                        <% }
                            }%>
                        <button type="button" class="btn btn-warning" style="width: 100%;">Checkout</button>                        
                    </form>
                </div>
                <div class="">
                </div>

            </div>
        </div>
    </div>
</div>


<jsp:include page="./SiteParts/dash_footer.jsp" />   