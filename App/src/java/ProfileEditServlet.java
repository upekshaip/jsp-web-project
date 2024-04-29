
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
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("./login.jsp?err=Please Login to place orders!!");
            return;
        }

        String username = request.getParameter("username");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");

        DB db = new DB();

        if (db.checkEmail2(email, username) == 0) {
            response.sendRedirect("profile.jsp?err=Email Alredy Exists. Try Another One!!");
            return;
        }

        HashMap user = db.updateUser(username, first_name, last_name, email, gender);

        if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect("profile.jsp?ok=You Details Updated Successfully!!");

        } else {
            response.sendRedirect("profile.jsp?err=Server Error");
        }
    }
}
