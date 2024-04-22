
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/ChangeAmount"})
public class ChangeAmount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();

        String id = (String) request.getParameter("id");
        String method = (String) request.getParameter("method");

        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("./login.jsp?err=Please Login to place orders");
        }
        if (id != null && method != null) {
            HashMap<Integer, HashMap<String, Object>> cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");

            int product_id = Integer.parseInt(id);

            if (method.equals("inc")) {
                int item_count = (int) cart.get(product_id).get("items");

                if ((int) cart.get(product_id).get("available_count") > item_count) {
                    item_count++;
                    cart.get(product_id).put("items", item_count);
                    out.println("{\"id\":" + id + ", \"value\":" + item_count + "}");
                } else {
                    out.println("{\"id\":" + id + ", \"value\":" + item_count + "}");
                }

            } else if (method.equals("dec")) {
                int item_count = (int) cart.get(product_id).get("items");
                if (item_count > 1) {
                    item_count = item_count - 1;
                    cart.get(product_id).put("items", item_count);
                    out.println("{\"id\":" + id + ", \"value\":" + item_count + "}");
                } else {
                    out.println("{\"id\":" + id + ", \"value\":" + item_count + "}");
                }
            }
        }
    }
}
