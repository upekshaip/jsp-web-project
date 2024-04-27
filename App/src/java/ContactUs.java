
import Config.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/ContactUs"})
public class ContactUs extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        if (name != null && email != null && subject != null && message != null) {
            DB db = new DB();
            int x = db.contactus(name, email, subject, message);
            if (x > 0) {
                response.sendRedirect("./contact-us.jsp?ok=Your message has been sent successfully");
            } else {
                response.sendRedirect("./contact-us.jsp?err=Server Error");
            }
        } else {
            response.sendRedirect("./contact-us.jsp?err=Please Fill All Required fields");
        }
    }

}
