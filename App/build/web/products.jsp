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

<section class="container defalt-container-style text-white brand-name-banner"><%=brand_name%></section>

<section class="container defalt-container-style row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 px-2 py-0">     
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
                    <button class="btn btn-warning" <%=btn%> type="button">Add to Cart</button>
                    <button class="btn btn-outline-light" type="button">View More</button>
                </div>
            </div>
        </div>
    </div>
    <%
            }
        }

    %>
</section>
<%     }
%>


<jsp:include page="./SiteParts/dash_footer.jsp" />   