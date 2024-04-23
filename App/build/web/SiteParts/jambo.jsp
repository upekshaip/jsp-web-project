<%
    String url = (String) request.getAttribute("url");
    String topic = (String) request.getAttribute("topic");
    String description = (String) request.getAttribute("description");
%>

<section class="container defalt-container-style"
         style="position:relative; background: url('<%=url%>'); background-position: center; background-repeat: no-repeat; background-size: cover; padding: 0;">
    <div style="width:100%; background-color: rgba(0, 0, 0, 0.4);">
        <div class="text-white rounded" style="padding: 100px 50px">
            <b><h1 style="color:white; text-transform: uppercase; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">
                    <%=topic%>
                </h1></b>
            <p>
                <%=description%>
            </p>
        </div>
    </div>
</section>