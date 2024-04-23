
import Config.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/ChangeOrderStatus"})
public class ChangeOrderStatus extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !(session.getAttribute("role").equals("admin"))) {
            response.sendRedirect("./login.jsp?err=Please Login to place orders");
            return;
        }
        String order_id = request.getParameter("order_id").trim();
        String status = request.getParameter("status").trim();

        DB db = new DB();
        int res = db.updateOrderStatus(order_id, status);
        if (res > 0) {
            response.sendRedirect("./admin.jsp?page=orders&ok=Status Changed Successfully");
            return;
        }
        response.sendRedirect("./admin.jsp?page=orders&ok=Server Error");

    }

}
