package Config;

public class Config {

    String PORT = "3306";
    String DB_NAME = "java_web";
    public static String ITEM_COUNT_CHANGE_API = "http://localhost:8080/App/ChangeAmount";
    public static String ADD_TO_CART_API = "http://localhost:8080/App/AddToCart";
    public static String REMOVE_FROM_CART_API = "http://localhost:8080/App/RemoveFromCart";
    public static String[] BRANDS = {"Casio", "Rolex", "Seiko", "Citizen", "Fossil", "Swatch", "Omega"};
}
