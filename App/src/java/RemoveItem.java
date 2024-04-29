
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 
 */
@WebServlet(urlPatterns = {"/RemoveItem"})
public class RemoveItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        int id = Integer.parseInt(request.getParameter("id"));

        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("./login.jsp?err=Please Login to place orders");
            return;
        }
        HashMap<Integer, HashMap<String, Object>> cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");
        if (cart.containsKey(id)) {
            cart.remove(id);
            response.sendRedirect("./cart.jsp?ok=Item removed from the cart");
            
        } else {
            response.sendRedirect("./cart.jsp?err=No items to remove");
        }
    }

}
