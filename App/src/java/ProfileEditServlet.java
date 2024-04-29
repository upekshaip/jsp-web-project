import Config.DB;
import java.io.IOException;
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
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");

        DB db = new DB();

        if (db.isEmailTaken(email, username)) {
            response.sendRedirect("profile.jsp?err=Email Already Exists. Try Another One");
            return;
        }

        HashMap<String, String> updatedUser = db.updateUser(username, firstName, lastName, email, gender);

        if (updatedUser != null) {
            session.setAttribute("user", updatedUser);
            response.sendRedirect("profile.jsp?ok=Your Details Updated Successfully");
        } else {
            response.sendRedirect("profile.jsp?err=Server Error");
        }
    }
}
