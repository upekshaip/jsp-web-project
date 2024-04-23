<%@page import="java.util.HashMap"%>
<%@page import="Config.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !(role.equals("user") || role.equals("admin"))) {
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
    ResultSet rs = db.getOrders((String) user.get("uid"));
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
                        String color = "info";
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
    ResultSet rss = db.getOrders((String) user.get("uid"));
    while (rss.next()) {
        int order_id = rss.getInt("orderId");
        String date = rss.getString("date");
        String status = rss.getString("status");
        String name = rss.getString("productName");
        double original_price = rss.getDouble("original");
        double discount = rss.getDouble("discount");
        double price = rss.getDouble("itemPrice");
        int pid = rss.getInt("productId");

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
        String color = "info";
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
                    <div class="mb-4">

                        <div class="mb-3 d-flex justify-content-between align-items-center">
                            <p class="m-0"><span class="badge text-bg-light" style="text-transform: uppercase;"><%=date%></span></p>
                            <p class="m-0"><span class="badge text-bg-<%=color%>"><%=status%></span></p>
                        </div>
                        <h5 class="card-title text-white"><%=name%></h5>
                        <p class="mt-3"><%=description%></p>
                    </div>
                    <div>
                        <p class="mb-2">Order ID: <span class="badge text-bg-light" style="text-transform: uppercase;"><%=order_id%></span></p>
                        <h4 class="mb-2"><span class="badge text-bg-primary" style="text-transform: uppercase;"><%=brand%></span></h4>
                        <h4 class="price my-0"><%=price%> LKR (Purchesed Price)</h4>
                        <%
                            if (discount > 0) {%>
                        <p class="discount-price my-0"><s><%=original_price%> LKR</s></p>                        
                                <%
                                    }
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

                        <div class="modal-footer p-0">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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


<jsp:include page="./SiteParts/dash_footer.jsp" />   