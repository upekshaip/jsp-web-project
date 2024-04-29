import Config.DB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

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
            // Retrieve cart from the session
            HashMap<Integer, HashMap<String, Object>> cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");

            DB db = new DB();
            // Place the order
            int result = db.placeOrder(userId, username, cart);
            if (result > 0) {
                // Order successfully placed
                session.setAttribute("cart", new HashMap<>()); // Clear the cart
                response.sendRedirect("./orders.jsp?ok=Order Completed");
            } else if (result == 0) {
                // No items selected for order
                response.sendRedirect("./cart.jsp?err=Please select at least one item");
            } else {
                // Server error
                response.sendRedirect("./cart.jsp?err=Server Error");
            }
        } else {
            // Person parameter does not match the logged-in user
            response.sendRedirect("./index.jsp");
        }
    }
}
