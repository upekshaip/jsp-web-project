<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageTitle = "Admin Panel";
    request.setAttribute("title", pageTitle);

    String role = (String) session.getAttribute("role");
    if (role == null || role.equals("user")) {
        response.sendRedirect("index.jsp");
        return;
    }
    String my_page = (String) request.getParameter("page");

%>
<jsp:include page="./SiteParts/dash_header.jsp" />
<jsp:include page="./SiteParts/alerts.jsp" />
<jsp:include page="./SiteParts/submenubar.jsp" />


<section class="container defalt-container-style d-flex justify-content-between align-items-center">
    <h2 id="page_topic" class="m-0">Orders</h2>
    <div class="d-flex justify-content-center align-items-center">
        <button id="button1" class="btn btn-primary mx-1 btn-sm">Orders</button>
        <button id="button2" class="btn btn-primary mx-1 btn-sm">Products</button>
        <button id="button3" class="btn btn-primary mx-1 btn-sm">Users</button>
    </div>
</section>


<div id="section1" class="" style="display: none;">
    <jsp:include page="./SiteParts/admin_orders.jsp" />
</div>
<div id="section2" class="" style="display: none;">
    <jsp:include page="./SiteParts/admin_products.jsp" />
</div>
<div id="section3" class="" style="display: none;">
    <jsp:include page="./SiteParts/admin_users.jsp" />
</div>

<section class="container defalt-container-style d-flex justify-content-between align-items-center">
    <h3 id="page_topic" class="m-0">Orders</h3>
    <div class="d-flex justify-content-center align-items-center">
        <input id="searchInput" type="text" placeholder="Search...">
        <button id="button1" class="btn btn-primary mx-1 btn-sm">Orders</button>
        <button id="button2" class="btn btn-primary mx-1 btn-sm">Products</button>
        <button id="button3" class="btn btn-primary mx-1 btn-sm">Users</button>
    </div>
</section>

<section class="container defalt-container-style d-flex justify-content-between align-items-center">
    <h3 id="page_topic" class="m-0">Orders</h3>
    <div class="d-flex justify-content-center align-items-center">
        <input id="searchInput" type="text" placeholder="Search...">
        <button id="button1" class="btn btn-primary mx-1 btn-sm">Orders</button>
        <button id="button2" class="btn btn-primary mx-1 btn-sm">Products</button>
        <button id="button3" class="btn btn-primary mx-1 btn-sm">Users</button>
    </div>
</section>

<script>
    // Function to show Section 1 and hide Section 2
    function showSection1() {
        // your existing code here
    }

    // Function to show Section 2 and hide Section 1
    function showSection2() {
        // your existing code here
    }

    function showSection3() {
        // your existing code here
    }

    // Add event listeners to the buttons
    document.getElementById("button1").addEventListener("click", showSection1);
    document.getElementById("button2").addEventListener("click", showSection2);
    document.getElementById("button3").addEventListener("click", showSection3);

    // Search functionality
    document.getElementById("searchInput").addEventListener("input", function() {
        let searchText = this.value.toLowerCase();
        let currentPage = document.getElementById("page_topic").innerText.toLowerCase();
        if (currentPage === "orders") {
            searchOrders(searchText);
        } else if (currentPage === "products") {
            searchProducts(searchText);
        } else if (currentPage === "users") {
            searchUsers(searchText);
        }
    });
    function connectOrders(searchText) {
        // AddProductServlet connect any server-side logic to connect orders
        // Update the display with connected results
        document.getId("section1").style.dis = "block";
        document.getId("section2").style.dis = "none";
        document.getId("section3").style.dis = "none";
    }
    
    function searchOrders(searchText) {
        // AJAX call or any server-side logic to search orders
        // Update the display with search results
    }

    function searchProducts(searchText) {
        // AJAX call or any server-side logic to search products
        // Update the display with search results
    }

    function searchUsers(searchText) {
        // AJAX call or any server-side logic to search users
        // Update the display with search results
    }
</script>

<script>
    // Function to show Section 1 and hide Section 2
    function showSection1() {
        // your existing code here
    }
    // Function to show Section 2 and hide Section 1
    function showSection2() {
        // your existing code here
    }
    function showSection3() {
        // your existing code here
    }
    // Add event listeners to the buttons
    document.getElementById("button1").addEventListener("click", showSection1);
    document.getElementById("button2").addEventListener("click", showSection2);
    document.getElementById("button3").addEventListener("click", showSection3);

    // Search functionality
    document.getElementById("searchInput").addEventListener("input", function() {
        let searchText = this.value.toLowerCase();
        let currentPage = document.getElementById("page_topic").innerText.toLowerCase();

        if (currentPage === "orders") {
            searchOrders(searchText);
        } else if (currentPage === "products") {
            searchProducts(searchText);
        } else if (currentPage === "users") {
            searchUsers(searchText);
        }
    });

    function searchOrders(searchText) {
        // AJAX call or any server-side logic to search orders
        // Update the display with search results
    }

    function searchProducts(searchText) {
        // AJAX call or any server-side logic to search products
        // Update the display with search results
    }

    function searchUsers(searchText) {
        // AJAX call or any server-side logic to search users
        // Update the display with search results
    }
</script>

<script>
    // Function to show Section 1 and hide Section 2
    let page_topic = document.getElementById("page_topic")
    function showSection1() {
        document.getElementById("section1").style.display = "block";
        document.getElementById("section2").style.display = "none";
        document.getElementById("section3").style.display = "none";
        page_topic.innerHTML = "Orders"
    }

    // Function to show Section 2 and hide Section 1
    function showSection2() {
        document.getElementById("section1").style.display = "none";
        document.getElementById("section2").style.display = "block";
        document.getElementById("section3").style.display = "none";
        page_topic.innerHTML = "Products"
    }

    function showSection3() {
        document.getElementById("section1").style.display = "none";
        document.getElementById("section2").style.display = "none";
        document.getElementById("section3").style.display = "block";
        page_topic.innerHTML = "Users"
    }

    // Add event listeners to the buttons
    document.getElementById("button1").addEventListener("click", showSection1);
    document.getElementById("button2").addEventListener("click", showSection2);
    document.getElementById("button3").addEventListener("click", showSection3);

    // Show Section 1 by default when the page loads
    <%        int pg_number = 1;
        if (my_page != null && my_page.equals("orders")) {
            pg_number = 1;
        } else if (my_page != null && my_page.equals("products")) {
            pg_number = 2;
        } else if (my_page != null && my_page.equals("users")) {
            pg_number = 3;
        }
    %>
    window.onload = function () {
        showSection<%=pg_number%>();
    };
</script>


<jsp:include page="./SiteParts/dash_footer.jsp" />   
