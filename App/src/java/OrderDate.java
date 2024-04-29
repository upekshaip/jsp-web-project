
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = {"/OrderDate"})
public class OrderDate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        Object orderDate = null;
        request.setAttribute("orderDate", orderDate);
        RequestDispatcher dispatcher = request.getRequestDispatcher("yourJSP.jsp");
        dispatcher.forward(request, response);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedOrderDate = dateFormat.format(orderDate);
   
        request.setAttribute("orderDate", formattedOrderDate);
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
  
}
                                                                                                                            