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

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        DB db = new DB();
        HashMap user = db.loginUser(username, password);

        PrintWriter out = response.getWriter();

        if (user != null) {
        out.println(user);        
        out.println("login success");
        
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("username", user.get("username"));
            response.sendRedirect("dashboard.jsp");
        
        } else {
            response.sendRedirect("login.jsp?err=Check Username Or Password");
        }
         
    }


}
