import Config.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/ProfileEditServlet"})
public class ProfileEditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        
        DB db = new DB();
        HashMap user = db.loginUser(username, password);

        if (user != null) {
        
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        response.sendRedirect("index.jsp");
        
        } else {
            response.sendRedirect("login.jsp?err=Check Username Or Password");
        }
    }
}
