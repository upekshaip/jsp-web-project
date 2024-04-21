package Config;

import java.util.ArrayList;
import java.util.HashMap;

public class Functions {

    public void Functions() {
    }

    public String setGender(String gender) {
        String[] genders = {"Male", "Female", "Other"};

        String result = "";
        for (int i = 0; i < genders.length; i++) {
            if (gender.equals(genders[i])) {
                String text = "<option value='" + genders[i] + "' " + "selected" + ">" + genders[i] + "</option>";
                result += text;
            } else {
                String text = "<option value='" + genders[i] + "'" + ">" + genders[i] + "</option>";
                result += text;
            }
        }
        return result;
    }

    public HashMap<Integer, HashMap<String, Object>> addItemToCart(HashMap<Integer, HashMap<String, Object>> cart, int id, String name, float price, float old_price, float discount, int available_count, String brand, String photo) {

        if (cart.containsKey(id)) {
            return null;
        }

        HashMap<String, Object> item = new HashMap<>();
        item.put("id", id);
        item.put("name", name);
        item.put("price", price);
        item.put("old_price", old_price);
        item.put("discount", discount);
        item.put("available_count", available_count);
        item.put("brand", brand);
        item.put("photo", photo);
        cart.put(id, item);

        return cart;
    }
}
