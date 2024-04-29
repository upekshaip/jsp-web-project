import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {
    private Map<String, Integer> items;
    private double totalPrice;
    private String discountCode;
    private double discountAmount;

    public ShoppingCart() {
        items = new HashMap<>();
        totalPrice = 0.0;
        discountCode = "";
        discountAmount = 0.0;
    }

    public void addItem(String item, int quantity, double pricePerItem) {
        items.put(item, items.getOrDefault(item, 0) + quantity);
        totalPrice += quantity * pricePerItem;
    }

    public void applyDiscount(String code, double discountPercentage) {
        if (code.equals(discountCode)) {
            System.out.println("Discount code already applied.");
            return;
        }
        discountCode = code;
        double discount = totalPrice * discountPercentage / 100;
        discountAmount = Math.min(discount, totalPrice); 
        
        // Apply discount, but not exceeding total price
        totalPrice -= discountAmount;
        System.out.println("Discount applied successfully.");
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public double getDiscountAmount() {
        return discountAmount;
    }

    public static void main(String[] args) {
        ShoppingCart cart = new ShoppingCart();
        cart.addItem("Product 1", 2, 10.0);
        cart.addItem("Product 2", 1, 20.0);

        System.out.println("Total price before discount: $" + cart.getTotalPrice());

        cart.applyDiscount("DISCOUNT25", 25);

        System.out.println("Total price after discount: $" + cart.getTotalPrice());
        System.out.println("Discount amount: $" + cart.getDiscountAmount());
    }
}
