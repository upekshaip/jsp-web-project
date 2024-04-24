
import Config.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/EditProduct"})
public class EditProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !(session.getAttribute("role").equals("admin"))) {
            response.sendRedirect("./login.jsp?err=Please Login to place orders");
            return;
        }
        String product_id = request.getParameter("product_id").trim();
        String product_name = request.getParameter("product_name").trim();
        String brand = request.getParameter("brand").trim();
        String description = request.getParameter("description").trim();
        String price = request.getParameter("price").trim();
        String discount = request.getParameter("discount").trim();
        String items = request.getParameter("items").trim();
        String photo = request.getParameter("photo").trim();

        DB db = new DB();
        int res = db.updateProduct(product_id, product_name, description, brand, price, discount, items, photo);
        if (res > 0) {
            response.sendRedirect("./admin.jsp?page=products&ok=Product edited successfully");
            return;
        }
        response.sendRedirect("./admin.jsp?page=products&err=Server Error");

    }

}
