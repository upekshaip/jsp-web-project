import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class cartSummary extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Cart Summary</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h1>Cart Summary</h1>");

        if (cart == null || cart.isEmpty()) {
            out.println("<p>Your cart is empty</p>");
        } else {
            out.println("<table border='1'>");
            out.println("<tr><th>Item</th><th>Quantity</th></tr>");
            for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                out.println("<tr><td>" + entry.getKey() + "</td><td>" + entry.getValue() + "</td></tr>");
            }
            out.println("</table>");
        }

        out.println("<a href='/shop'>Back to Shopping</a>");
        out.println("</body>");
        out.println("</html>");
    }
}
