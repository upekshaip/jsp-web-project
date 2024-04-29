import Config.DB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String gender = request.getParameter("gender");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password_rep = request.getParameter("password_rep");

        // Check if any required field is empty
        if (isEmpty(username) || isEmpty(email) || isEmpty(password) || isEmpty(password_rep)
                || isEmpty(first_name) || isEmpty(last_name) || isEmpty(gender)) {
            redirectWithError(response, "All fields need to be filled");
            return;
        }

        // Check if username contains only alphanumeric characters
        if (!isValidUsername(username)) {
            redirectWithError(response, "Username can only contain characters from a-z and 0-9");
            return;
        }

        // Check if password contains at least one special character
        if (!containsSpecialCharacter(password)) {
            redirectWithError(response, "Password needs to have at least one special character");
            return;
        }

        // Check if passwords match
        if (!password.equals(password_rep)) {
            redirectWithError(response, "Passwords do not match");
            return;
        }

        DB db = new DB();

        // Check if username already exists
        if (db.checkUsername(username) > 0) {
            redirectWithError(response, "Username already exists. Please try another one");
            return;
        }

        // Check if email already exists
        if (db.checkEmail(email) > 0) {
            redirectWithError(response, "Email already exists. Please try another one");
            return;
        }

        // Register the user
        int result = db.registerUser(username, password, first_name, last_name, gender, email);
        if (result > 0) {
            response.sendRedirect("signup.jsp?ok=User registered successfully");
        } else {
            redirectWithError(response, "Server Error");
        }
    }

    // Method to check if a string is empty or null
    private boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

    // Method to check if username contains only alphanumeric characters
    private boolean isValidUsername(String username) {
        return username.matches("^[a-zA-Z0-9]*$");
    }

    // Method to check if password contains at least one special character
    private boolean containsSpecialCharacter(String password) {
        return password.matches(".*[!@#$%^&*()\\-_=+\\\\|\\[{\\]};:'\",<.>/?`~].*");
    }

    // Method to redirect with an error message
    private void redirectWithError(HttpServletResponse response, String errorMessage) throws IOException {
        response.sendRedirect("signup.jsp?err=" + errorMessage);
    }
}
