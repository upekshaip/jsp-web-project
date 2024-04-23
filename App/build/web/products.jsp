<%@page import="java.util.HashMap"%>
<%@page import="Config.DB"%>
<%@page import="Config.Config"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//    topic
    String pageTitle = "Products";
    request.setAttribute("title", pageTitle);
//    jambo
    request.setAttribute("url", "./img/14.jpg");
    request.setAttribute("topic", "YOU CAN BUY HIGH QUALITY WATCHES");
    request.setAttribute("description", "This is the shop you are looking...");
    HashMap<Integer, HashMap<String, Object>> cart = new HashMap<>();
    if (session != null) {
    cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");
    }
%>
<jsp:include page="./SiteParts/dash_header.jsp" />
<jsp:include page="./SiteParts/alerts.jsp" />   

<%
    String role = (String) session.getAttribute("role");
    if (role != null) { %>    
<jsp:include page="./SiteParts/submenubar.jsp" />
<%  } %>
<jsp:include page="./SiteParts/jambo.jsp" />   

<%
    for (int i = 0; i < Config.BRANDS.length; i++) {
        String brand_name = Config.BRANDS[i];
%>

<section class="container defalt-container-style text-white brand-name-banner text-center mt-5" style="text-transform: uppercase"><h1 class="m-0">- <%=brand_name%> -</h1></section>

<section class="container defalt-container-style row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 px-2 py-0 pb-4">     
    <%
        DB db = new DB();
        ResultSet rs = db.getProducts();
        while (rs.next()) {
            String brand = rs.getString("shortDescription");
            if (brand_name.equals(brand)) {

                String name = rs.getString("name");
                int product_id = rs.getInt("productId");
                String description = rs.getString("description");
                float price = rs.getFloat("price");
                float discount = rs.getFloat("discount");
                int available_count = rs.getInt("availableCount");
                String photo = rs.getString("photo");
                boolean in_stock = false;
                String btn = "disabled";
                float original_price = price;

                if (available_count > 0) {
                    in_stock = true;
                    btn = "";
                }

                if (discount > 0) {
                    price = price * (100 - discount) / 100;
                }

                int quantity = 0;
                if (cart != null && cart.containsKey(product_id)) {
                quantity = (int)cart.get(product_id).get("items");
        }
    %>
    <div class="col">
        <div class="card bg-dark">
            <div class="card-img-container">
                <img src="<%=photo%>" class="card-img-top" alt=".">
                <div class="card-img-blend"></div>
            </div>
            <div class="card-body">
                <h5 class="card-title text-white"><%=name%></h5>
                <h4 class="price my-0"><%=price%> LKR</h4>
                <%
                    if (discount > 0) {%>
                <p class="discount-price my-0"><s><%=original_price%> LKR</s></p>                        
                        <%
                            }
                            if (discount > 0) {%>
                <p class="discount my-0"><%=discount%>% Off</p>   
                <% } %>

                <%
                    if (in_stock) { %>
                <p class="availability my-2">Availability: <span class="badge text-bg-success">Available</span></p>
                <% } else { %>
                <p class="availability my-2">Availability: <span class="badge text-bg-warning">Out Of Stock</span></p>
                <% }%>

                <div class="d-grid gap-2 mt-3">    
                    <input type="hidden" name="id" value="<%=product_id%>">
                    <input type="hidden" id="quantity_<%=product_id%>" value="<%=quantity%>">
                    <%
                        if (cart != null && cart.containsKey(product_id)) {
                    %>
                    <button id="cart_button_<%=product_id%>" class="btn btn-danger" value='remove' type="button" onClick="removeFromCart('<%=product_id%>')">Remove from Cart</button>
                    <%
                    } else {%>

                    <button id="cart_button_<%=product_id%>" class="btn btn-warning" <%=btn%> type="button" value='add' onClick="addToCart('<%=product_id%>')">Add to Cart</button>
                    <%
                        }
                    %>
                    <button class="btn btn-outline-light" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal<%=product_id%>">
                        View More
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!--MODEL-->

    <div class="modal fade" id="exampleModal<%=product_id%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content bg-dark">

                <div class="modal-body model-custom">
                    <div class="image-holder">
                        <img src="<%=photo%>" class="img-holder-img" alt="...">
                    </div>
                    <div class="bg-dark text-white model-contents">
                        <div class="mb-4">
                            <h5 class="card-title text-white"><%=name%></h5>
                            <p class="mt-3"><%=description%></p>
                        </div>
                        <div>
                            <h4 class="mb-2"><span class="badge text-bg-primary" style="text-transform: uppercase;"><%=brand%></span></h4>
                            <h4 class="price my-0"><%=price%> LKR</h4>
                            <%
                                if (discount > 0) {%>
                            <p class="discount-price my-0"><s><%=original_price%> LKR</s></p>                        
                                    <%
                                        }
                                        if (discount > 0) {%>
                            <p class="discount my-0"><%=discount%>% Off</p>   
                            <% } %>

                            <%
                                if (in_stock) { %>
                            <p class="availability my-2">Availability: <span class="badge text-bg-success">Available</span></p>
                            <% } else { %>
                            <p class="availability my-2">Availability: <span class="badge text-bg-warning">Out Of Stock</span></p>
                            <% }%>

                            <div class="modal-footer p-0">    
                                <input type="hidden" name="id" value="<%=product_id%>">
                                <%
                                    if (cart != null && cart.containsKey(product_id)) {
                                %>
                                <button id="cart_button2_<%=product_id%>" class="btn btn-danger" value='remove' type="button" onClick="removeFromCart('<%=product_id%>')">Remove from Cart</button>
                                <% } else {%>

                                <button id="cart_button2_<%=product_id%>" class="btn btn-warning" <%=btn%> type="button" value='add' onClick="addToCart('<%=product_id%>')">Add to Cart</button>
                                <%
                                    }
                                %>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>


                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <!--MODEL-->

    <%
            }
        }

    %>
</section>
<%     }
%>


<jsp:include page="./SiteParts/dash_footer.jsp" />   