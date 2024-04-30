import Config.DB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Check if all required fields are filled
        if (isNullOrEmpty(name) || isNullOrEmpty(email) || isNullOrEmpty(subject) || isNullOrEmpty(message)) {
            response.sendRedirect("./contact-us.jsp?err=Please Fill All Required Fields");
            return;
        }

        // Save the message in the database
        DB db = new DB();
        int result = db.contactus(name, email, subject, message);
        
        // Redirect based on the result
        if (result > 0) {
            response.sendRedirect("./contact-us.jsp?ok=Your message has been sent successfully");
        } else {
            response.sendRedirect("./contact-us.jsp?err=Server Error");
        }
    }

    // Method to check if a string is null or empty
    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
