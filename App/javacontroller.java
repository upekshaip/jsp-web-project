import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        // Call a method to retrieve new arrivals data
        List<Item> newArrivals = getNewArrivals();
        
        // Add new arrivals data to the model
        model.addAttribute("newArrivals", newArrivals);
        
        // Return the name of the Thymeleaf template (index.html)
        return "index";
    }

    // Method to retrieve new arrivals data (replace this with your actual implementation)
    private List<Item> getNewArrivals() {
        // Retrieve new arrivals data from your database or service
        // This is just a dummy example, you should replace it with your actual logic
        List<Item> newArrivals = new ArrayList<>();
        newArrivals.add(new Item("Item 1"));
        newArrivals.add(new Item("Item 2"));
        newArrivals.add(new Item("Item 3"));
        return newArrivals;
    }
}
