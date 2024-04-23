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
    <h3 id="page_topic" class="m-0">Orders</h3>
    <div class="d-flex justify-content-center align-items-center">
        <button id="button1" class="btn btn-primary mx-1">Orders</button>
        <button id="button2" class="btn btn-primary mx-1">Products</button>
        <button id="button3" class="btn btn-primary mx-1">Users</button>
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