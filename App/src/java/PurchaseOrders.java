
import Config.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/PurchaseOrders"})
public class PurchaseOrders extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || (session.getAttribute("role")) == null) {
            response.sendRedirect("./login.jsp?err=Please Login to place orders");
            return;
        }

        HashMap user = (HashMap) session.getAttribute("user");
        int uid = Integer.parseInt((String) user.get("uid"));
        String person = request.getParameter("person");

        if (Integer.parseInt(person) == uid) {
            PrintWriter out = response.getWriter();
            HashMap<Integer, HashMap<String, Object>> cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");

            DB db = new DB();
            int x = db.placeOrder(uid, (String) user.get("username"), cart);
            if (x > 0) {
                response.sendRedirect("./orders.jsp?ok=Order Completed");
                return;
            } else if (x == 0) {
                response.sendRedirect("./cart.jsp?err=Please select at least one item");
                return;
            } else {
                response.sendRedirect("./cart.jsp?err=Server Error");
                return;
            }

        } else {
            response.sendRedirect("./index.jsp");
            return;
        }

    }
}
