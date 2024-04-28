import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ProductServlet extends HttpServlet {
    
    // Sample product data (replace with your actual product data)
    private List<Product> products = Arrays.asList(
        new Product(1, "Product A", 100),
        new Product(2, "Product B", 200),
        new Product(3, "Product C", 150)
    );

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        // Retrieve the sort parameter from the request
        String sortParam = request.getParameter("sort");
        
        // Sort the products based on the sort parameter
        if ("name".equals(sortParam)) {
            Collections.sort(products, Comparator.comparing(Product::getName));
        } else if ("price".equals(sortParam)) {
            Collections.sort(products, Comparator.comparing(Product::getPrice));
        }
        
        // Set products as an attribute to be accessed in JSP
        request.setAttribute("products", products);
        
        // Forward the request to the JSP page for rendering
        RequestDispatcher dispatcher = request.getRequestDispatcher("/products.jsp");
        dispatcher.forward(request, response);
    }
}
