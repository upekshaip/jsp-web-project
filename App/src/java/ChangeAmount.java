import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangeAmount")
public class ChangeAmount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");
        String method = request.getParameter("method");

        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("./login.jsp?err=Please Login to place orders");
            return;
        }

        if (id != null && method != null) {
            HashMap<Integer, HashMap<String, Object>> cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");

            int productId = Integer.parseInt(id);

            if (cart.containsKey(productId)) {
                int itemCount = (int) cart.get(productId).get("items");
                int availableCount = (int) cart.get(productId).get("available_count");

                if ("inc".equals(method) && availableCount > itemCount) {
                    itemCount++;
                    cart.get(productId).put("items", itemCount);
                    out.println("{\"id\":" + id + ", \"value\":" + itemCount + "}");
                } else if ("dec".equals(method) && itemCount > 1) {
                    itemCount--;
                    cart.get(productId).put("items", itemCount);
                    out.println("{\"id\":" + id + ", \"value\":" + itemCount + "}");
                } else {
                    // No change in item count
                    out.println("{\"id\":" + id + ", \"value\":" + itemCount + "}");
                }
            } else {
                // Product not found in cart
                out.println("{\"id\":" + id + ", \"value\":0}");
            }
        } else {
            // Invalid request parameters
            out.println("{\"id\":0, \"value\":0}");
        }
    }
}
