import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLogout")
public class AdminLogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Retrieve the session without creating a new one if it doesn't exist

        if (session != null) {
            session.invalidate(); // Invalidate the session, effectively logging out the admin
            response.sendRedirect("adminLogin.jsp"); // Redirect to admin login page
        } else {
            response.sendRedirect("adminLogin.jsp"); // If session doesn't exist, redirect to admin login page
        }
    }
}
