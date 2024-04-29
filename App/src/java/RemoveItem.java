import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@WebServlet(urlPatterns = {"/RemoveItem"})
public class RemoveItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if session exists and user is logged in
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("./login.jsp?err=Please Login to place orders");
            return;
        }
        
        // Get the product ID to remove from the cart
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Retrieve the cart from the session
        HashMap<Integer, HashMap<String, Object>> cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");
        
        // Check if the cart contains the item to remove
        if (cart != null && cart.containsKey(id)) {
            // Remove the item from the cart
            cart.remove(id);
            response.sendRedirect("./cart.jsp?ok=Item removed from the cart");
        } else {
            response.sendRedirect("./cart.jsp?err=No items to remove");
        }
    }
}
