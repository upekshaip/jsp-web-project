import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class WishlistService extends HttpServlet {
    private WishlistService wishlistService = new WishlistServiceImpl(); // Inject your service implementation

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        User user = (User) request.getSession().getAttribute("user"); // Assuming user is stored in session
        
        if (productId != null && user != null) {
            Product product = productService.getProductById(productId);
            if (product != null) {
                wishlistService.removeFromWishlist(user, product);
            }
        }
        
        response.sendRedirect("wishlist.jsp");
    }
}
