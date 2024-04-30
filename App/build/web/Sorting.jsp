import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ProductServlet extends HttpServlet {

    private List<Product> products = Arrays.asList(
        new Product(1, "Product A", 100),
        new Product(2, "Product B", 200),
        new Product(3, "Product C", 150)
    );

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sortParam = request.getParameter("sort");
        String sortOrder = request.getParameter("order"); // Add parameter for sort order

        // Default sort order is ascending
        Comparator<Product> comparator = null;
        if ("name".equals(sortParam)) {
            comparator = Comparator.comparing(Product::getName);
        } else if ("price".equals(sortParam)) {
            comparator = Comparator.comparing(Product::getPrice);
        }

        // Apply descending order if specified
        if ("desc".equals(sortOrder) && comparator != null) {
            comparator = comparator.reversed();
        }

        // Sort the products based on the comparator
        if (comparator != null) {
            Collections.sort(products, comparator);
        }

        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/products.jsp");
        dispatcher.forward(request, response);
    }
}
