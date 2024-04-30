
import Config.Functions;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String role = (String) session.getAttribute("role");

        if (session == null || role == null) {
            response.sendRedirect("./login.jsp?err=Please Login to place orders");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        Functions func = new Functions();
        HashMap<Integer, HashMap<String, Object>> cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");

        cart = func.addItemToCart(cart, id);

        if (cart == null) {
            response.sendRedirect("./products.jsp?err=Item already added to the cart");
            return;
        }

        int cart_size = 0;
        if (cart.size() > 0) {
            for (int key : cart.keySet()) {
                HashMap value = cart.get(key);
                cart_size += (int) value.get("items");
            }
        }

        PrintWriter out = response.getWriter();
        out.println("{\"id\":" + (String) request.getParameter("id") + ", \"total\":" + Integer.toString(cart_size) + " }");
//        response.sendRedirect("./products.jsp?ok=<i>" + Integer.toString(id) + "</i> added to the cart");  
    }
}
