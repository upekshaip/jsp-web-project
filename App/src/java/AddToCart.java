import java.io.IOException;
import java.io.PrintWriter;
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
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String id = request.getParameter("id");
        String price = request.getParameter("price");
        String old_price = request.getParameter("old_price");
        String discount = request.getParameter("discount");
        String photo = request.getParameter("photo");
        String available_count = request.getParameter("available_count");
        String brand = request.getParameter("brand");
        
        HttpSession session = request.getSession(false);
        String role = (String) session.getAttribute("role");
        
        if (role == null) {
        response.sendRedirect("./login.jsp?err=Please Login to place orders");
        return;
        }
        
        HashMap user = (HashMap) session.getAttribute("user");
        int custommer_id = Integer.parseInt((String) user.get("uid"));
        response.getWriter().println(custommer_id);
        
    }
}
