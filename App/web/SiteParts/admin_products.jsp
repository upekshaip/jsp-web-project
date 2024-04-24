<%@page import="Config.DB"%>
<%@page import="Config.Functions"%>
<%@page import="java.sql.*"%>

<section class="container d-flex justify-content-end align-items-center p-0 mb-2">
    <button id="button3" class="btn btn-warning m-0 btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Add New Product</button>
</section>

<%
    DB db = new DB();
    Functions func = new Functions();
    ResultSet rs = db.getProducts();
//        
%>

<!-- Modal -->
<div class="modal fade modal-xl" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form class="modal-content bg-dark"  method="post" action="AddProduct">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Add new product</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">


                <div class="row g-3 needs-validation">
                    <div class="col-md-6">
                        <label  class="form-label">Product name</label>
                        <input type="text" class="form-control form-control-sm defalt-input-style text-white" required name="product_name" placeholder="Product name">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Brand</label>
                        <select name="brand" class="form-control form-select-sm defalt-input-style text-white" required>
                            <%
                                String options = func.setBrands("");
                            %>
                            <%=options%>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label  class="form-label">Description</label>
                        <input type="text" class="form-control form-control-sm defalt-input-style text-white" required name="description" placeholder="Description">
                    </div>
                    <div class="col-md-6">
                        <label  class="form-label">Product price</label>
                        <input type="number" class="form-control form-control-sm defalt-input-style text-white" required name="price" placeholder="Product price">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Discount</label>
                        <input type="number" class="form-control form-control-sm defalt-input-style text-white" required name="discount" placeholder="Discount">
                    </div>
                    <div class="col-md-6">
                        <label  class="form-label">Available items</label>
                        <input type="number" class="form-control defalt-input-style text-white form-control-sm" name="items" placeholder="Available items" required>
                    </div>
                    <div class="col-md-6">
                        <label  class="form-label">Photo</label>
                        <input type="text" class="form-control defalt-input-style text-white form-control-sm" name="photo" placeholder="Photo" required>
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-warning btn-sm">Add Product</button>
                <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
            </div>
        </form>
    </div>
</div>


<section class="container p-0">
    <table class="table table-hover table-dark">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Brand</th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody style="vertical-align: middle;">
            <%
                while (rs.next()) {
            %>
            <tr>
                <th><%=rs.getInt("productId")%></th>
                <td><p class="m-0"><%=rs.getString("name")%></p></td>
                <td><p class="m-0"><%=rs.getString("shortDescription")%></p></td>
                <td><button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#productmodel<%=rs.getInt("productId")%>">Details</button></td>
            </tr>
            <% }%>

        </tbody>
    </table>

</section>

<%
    ResultSet prs = db.getProducts();
    while (prs.next()) {
%>

<!-- Modal -->
<div class="modal fade modal-xl" id="productmodel<%=prs.getInt("productId")%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form class="modal-content bg-dark"  method="post" action="EditProduct">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit Product Details</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">


                <div class="row g-3 needs-validation">
                    <div class="col-md-6">
                        <label  class="form-label">Product name</label>
                        <input type="text" value="<%=prs.getString("name")%>" class="form-control form-control-sm defalt-input-style text-white" required name="product_name" placeholder="Product name">
                        <input type="text" value="<%=prs.getString("productId")%>" required name="product_id" hidden>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Brand</label>
                        <select name="brand" class="form-control form-select-sm defalt-input-style text-white" required>
                            <%
                                String product_options = func.setBrands(prs.getString("shortDescription"));
                            %>
                            <%=product_options%>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label  class="form-label">Description</label>
                        <input type="text" value="<%=prs.getString("description")%>" class="form-control form-control-sm defalt-input-style text-white" required name="description" placeholder="Description">
                    </div>
                    <div class="col-md-6">
                        <label  class="form-label">Product price</label>
                        <input type="number" value="<%=prs.getFloat("price")%>" class="form-control form-control-sm defalt-input-style text-white" required name="price" placeholder="Product price">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Discount</label>
                        <input type="number" value="<%=prs.getFloat("discount")%>" class="form-control form-control-sm defalt-input-style text-white" required name="discount" placeholder="Discount">
                    </div>
                    <div class="col-md-6">
                        <label  class="form-label">Available items</label>
                        <input type="number" value="<%=prs.getInt("availableCount")%>" class="form-control defalt-input-style text-white form-control-sm" name="items" placeholder="Available items" required>
                    </div>
                    <div class="col-md-6">
                        <label  class="form-label">Photo</label>
                        <input type="text" value="<%=prs.getString("photo")%>" class="form-control defalt-input-style text-white form-control-sm" name="photo" placeholder="Photo" required>
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-warning btn-sm">Edit Product</button>
                <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
            </div>
        </form>
    </div>
</div>

<%
    }
%>