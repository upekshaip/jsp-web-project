import Config.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Config.DB;


@WebServlet(urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html");
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password_rep = request.getParameter("password_rep");
        String regex = "^[a-zA-Z0-9]*$";
        
        String specialCharRegex = ".*[!@#$%^&*()\\-_=+\\\\|\\[{\\]};:'\",<.>/?`~].*";
        
        
        if (username != null && !username.matches(regex)) {
            response.sendRedirect("signup.jsp?err=Username can only be characters from a-z and 0-9");
        }
        else if (password != null && !password.matches(specialCharRegex)) {
            response.sendRedirect("signup.jsp?err=Password needs to have at least one special character");
        }
        else if (password != null && !password.equals(password_rep)) {
            response.sendRedirect("signup.jsp?err=Passwords did not matched");
        }
        else if (username == null || email == null || password == null || password_rep == null || username == "" || email == "" || password == "" || password_rep == "")
        {
            response.sendRedirect("signup.jsp?err=All fields needs to be filled");        
        }
        else {
            String sql = "INSERT INTO users(username, email, password) VALUES ('" + username + "', '" + email + "', '" + password + "')";
            
            DB db = new DB();
            int x = db.run_sql(sql);
            if (x > 0) {
            response.sendRedirect("signup.jsp?ok=User Registered successfully"); 
            }
            
            else {
            response.sendRedirect("signup.jsp?err=Server Error"); 
            }
        }
        }


}