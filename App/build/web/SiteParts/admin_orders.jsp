<%@page import="Config.DB"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%
    DB db = new DB();
    ResultSet rs = db.getAllOrders();
%>


<section class="container p-0">
    <table class="table table-hover table-dark">
        <thead>
            <tr>
                <th scope="col">Date</th>
                <th scope="col">Product name</th>
                <th scope="col">Status</th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody style="vertical-align: middle;">
            <%
                while (rs.next()) {
                    int order_id = rs.getInt("orderId");
                    String date = rs.getString("date");
                    String status = rs.getString("status");
                    String name = rs.getString("productName");

            %>
            <tr>
                <th><%=date%></th>
                <td><%=name%></td>
                <td>
                    <%
                        String color = "danger";
                        if (status.equals("Pending")) {
                            color = "warning";
                        } else if (status.equals("Complete")) {
                            color = "success";
                        }
                    %>

                    <span class="badge text-bg-<%=color%>"><%=status%></span>
                </td>
                <td><button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal<%=order_id%>">Details</button></td>
            </tr>
            <% }%>
        </tbody>
    </table>

</section>


<%
    ResultSet rss = db.getAllOrders();
    while (rss.next()) {
        int order_id = rss.getInt("orderId");
        String date = rss.getString("date");
        String status = rss.getString("status");
        String name = rss.getString("productName");
        double original_price = rss.getDouble("original");
        double discount = rss.getDouble("discount");
        double price = rss.getDouble("itemPrice");
        int quantity = rss.getInt("quantity");
        int pid = rss.getInt("productId");
        int user_id = rss.getInt("userId");
        String username = rss.getString("username");

        double amount = price * quantity;

        ResultSet prs = db.getProduct(Integer.toString(pid));
        prs.next();
        String description = prs.getString("description");
        String photo = prs.getString("photo");
        String brand = prs.getString("shortDescription");
        int available_count = prs.getInt("availableCount");
        boolean in_stock = false;
        if (available_count > 0) {
            in_stock = true;
        }
        String color = "danger";
        if (status.equals("Pending")) {
            color = "warning";
        } else if (status.equals("Complete")) {
            color = "success";
        }
%>   


<div class="modal fade" id="exampleModal<%=order_id%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content bg-dark">

            <div class="modal-body model-custom">
                <div class="image-holder">
                    <img src="<%=photo%>" class="img-holder-img" alt="...">
                </div>
                <div class="bg-dark text-white model-contents">
                    <div class="mb-3">

                        <div class="mb-3 d-flex justify-content-between align-items-center">
                            <p class="m-0"><span class="badge text-bg-light" style="text-transform: uppercase;"><%=date%></span></p>
                            <p class="m-0"><span class="badge text-bg-<%=color%>"><%=status%></span></p>
                        </div>
                        <h5 class="card-title text-white"><%=name%></h5>
                        <p class="mt-3"><%=description%></p>
                    </div>
                    <div>
                        <p class="m-0">Order ID: <span class="badge text-bg-light"><%=order_id%></span></p>
                        <p class="mb-1">User ID: <span class="badge text-bg-light"><%=user_id%></span><span class="badge text-bg-light ms-1"><%=username%></span></p>
                        <h4 class="mb-2"><span class="badge text-bg-primary" style="text-transform: uppercase;"><%=brand%></span></h4>
                            <% if (discount > 0) {%>
                        <p class="discount-price my-0"><s><%=original_price%> LKR</s></p>                        
                                <% }%>
                        <h6 class="my-0"><%=price%> LKR x <%=quantity%></h6>
                        <h3 class="price my-0"><%=amount%> LKR</h4>
                            <%
                                if (discount > 0) {
                            %>
                            <p class="discount my-0"><%=discount%>% Off (Purchesed Discount)</p>   
                            <% } %>

                            <%
                            if (in_stock) {%>
                            <p class="availability my-2">Availability: <span class="badge text-bg-success"><%=available_count%> Items Available</span></p>
                            <% } else { %>
                            <p class="availability my-2">Availability: <span class="badge text-bg-warning">Out Of Stock</span></p>
                            <% }%>

                            <div class="modal-footer p-0 d-flex justify-content-between align-items-center">
                                <form action="ChangeOrderStatus" method="post">    
                                    <input type="hidden" name="order_id" value="<%=order_id%>">
                                    <button type="submit" name="status" value="Complete" class="btn btn-success btn-sm ms-0" data-bs-dismiss="modal">Complete</button>
                                    <button type="submit" name="status" value="Pending" class="btn btn-warning mx-1 btn-sm" data-bs-dismiss="modal">Pending</submit>
                                    <button type="submit" name="status" value="Failed" class="btn btn-danger mx-1 btn-sm" data-bs-dismiss="modal">Failed</button>
                                </form>
                                <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                            </div>


                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
<%
    }
%>



<!--MODEL-->