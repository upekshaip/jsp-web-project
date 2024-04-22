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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        HttpSession session = request.getSession(false);
        String role = (String) session.getAttribute("role");
        
        if (session == null || role == null) {
        response.sendRedirect("./login.jsp?err=Please Login to place orders");
        return;
        }
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int id = Integer.parseInt(request.getParameter("id"));
        float price = Float.parseFloat(request.getParameter("price"));
        float old_price = Float.parseFloat(request.getParameter("old_price"));
        float discount = Float.parseFloat(request.getParameter("discount"));
        String photo = request.getParameter("photo");
        int available_count = Integer.parseInt(request.getParameter("available_count"));
        String brand = request.getParameter("brand");
        
        
        
        Functions func = new Functions();
        HashMap<Integer, HashMap<String, Object>> cart = (HashMap<Integer, HashMap<String, Object>>) session.getAttribute("cart");
        
        cart = func.addItemToCart(cart, id, name, price, old_price, discount, available_count, brand, photo);
        if (cart == null) {
        response.sendRedirect("./products.jsp?err=Item already added to the cart");  
        return;
        }
        response.getWriter().println(cart);
        response.getWriter().println(session.getAttribute("user"));
        response.getWriter().println(cart.size());
        
        response.sendRedirect("./products.jsp?ok=<i>" + name + "</i> added to the cart");  
    }
}
