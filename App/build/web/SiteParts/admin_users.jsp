<%@page import="Config.DB"%>
<%@page import="java.sql.*"%>

<%
    DB db = new DB();
    ResultSet rs = db.getAllUsers();
%>


<section class="container p-0">
    <table class="table table-hover table-dark">
        <thead>
            <tr>
                <th scope="col">UID</th>
                <th scope="col">Name</th>
                <th scope="col">Username</th>
                <th scope="col">Email</th>
                <th scope="col">Gender</th>
            </tr>
        </thead>
        <tbody style="vertical-align: middle;">
            <%
                while (rs.next()) {
                    int uid = rs.getInt("uid");
                    String name = rs.getString("first_name") + " " + rs.getString("first_name");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String gender = rs.getString("gender");

            %>
            <tr>
                <th><%=uid%></th>
                <td><%=name%></td>
                <td><%=username%></td>
                <td><%=email%></td>
                <td><%=gender%></td>
            </tr>
            <% }%>
        </tbody>
    </table>

</section>
