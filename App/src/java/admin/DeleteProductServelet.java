package admin;

import java.util.*;

class ShoppingCart {
    private List<String> products;

    public ShoppingCart() {
        products = new ArrayList<>();
    }

    public void addProduct(String product) {
        products.add(product);
    }

    public void removeProduct(String product) {
        if (products.contains(product)) {
            products.remove(product);
            System.out.println(product + " removed from the cart.");
        } else {
            System.out.println(product + " is not in the cart.");
        }
    }

    public void displayCart() {
        System.out.println("Products in the cart:");
        for (String product : products) {
            System.out.println("- " + product);
        }
    }
}

