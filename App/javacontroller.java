import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        List<Item> newArrivals = getNewArrivals();
        
        model.addAttribute("newArrivals", newArrivals);
        
        return "index";
    }

    private List<Item> getNewArrivals() {
        List<Item> newArrivals = new ArrayList<>();
        newArrivals.add(new Item("Item 1"));
        newArrivals.add(new Item("Item 2"));
        newArrivals.add(new Item("Item 3"));
        newArrivals.add(new Item("Item 2"));
        newArrivals.add(new Item("Item 3"));
        return newArrivals;
    }
}
