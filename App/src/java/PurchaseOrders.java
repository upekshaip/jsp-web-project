import Config.DB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@WebServlet("/PurchaseOrders")
public class PurchaseOrders extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("./login.jsp?err=Please Login to place orders");
            return;
        }

        // Get user information from the session
        HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
        int userId = (int) user.get("uid");
        String username = (String) user.get("username");

        // Get the person parameter from the request
        String person = request.getParameter("person");

        // Check if the person matches the logged-in user
        if (Integer.toString(userId).equals(person)) {
            DB db = new DB();
            // Retrieve orders sorted by date
            List<Order> orders = db.getOrdersByUserIdSortedByDate(userId);

            if (orders.isEmpty()) {
                // No orders found
                response.sendRedirect("./cart.jsp?err=No orders found for this user");
                return;
            }

            // Process orders...
            // For demonstration purposes, let's just print them out
            for (Order order : orders) {
                System.out.println(order);
            }

            // You can continue processing the orders as needed

            response.sendRedirect("./orders.jsp?ok=Orders Retrieved Successfully");
        } else {
            // Person parameter does not match the logged-in user
            response.sendRedirect("./index.jsp");
        }
    }
}
