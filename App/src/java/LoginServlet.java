
import Config.DB;
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

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        DB db = new DB();
        HashMap user = db.loginUser(username, password);

        if (user != null) {
            HashMap<Integer, HashMap<String, Object>> cart = new HashMap<>();
            
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("username", user.get("username"));
            session.setAttribute("role", "user");
            if (user.get("username").equals("admin")) {
            session.setAttribute("role", "admin");
            }
            session.setAttribute("cart", cart);
            response.sendRedirect("index.jsp");

        } else {
            response.sendRedirect("login.jsp?err=Check Username Or Password");
        }

    }

}
