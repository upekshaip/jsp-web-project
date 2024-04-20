import Config.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Config.DB;
import java.util.HashMap;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/Test"})
public class Test extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html");
        
         PrintWriter out = response.getWriter();
         
//         DB db = new DB();
//         HashMap user = db.updateUser("johndoe", "John", "Doe", "jd@gmail.com", "Male");
//         out.print(user);
         
//         out.println(user + "<br>");
//         
//         DB db1 = new DB();
//         HashMap xx = db1.loginUser("asd@gmail.com", "@1234");
         
        HttpSession session = request.getSession(false);
        out.println(session.getAttribute("user"));
        out.println(session.getAttribute("username"));
         
    }


}