package Config;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    public String setBrands(String gender) {
        String[] brands = Config.BRANDS;

        String result = "";
        for (int i = 0; i < brands.length; i++) {
            if (gender.equals(brands[i])) {
                String text = "<option value='" + brands[i] + "' " + "selected" + ">" + brands[i] + "</option>";
                result += text;
            } else {
                String text = "<option value='" + brands[i] + "'" + ">" + brands[i] + "</option>";
                result += text;
            }
        }
        return result;
    }

    public HashMap<Integer, HashMap<String, Object>> addItemToCart(HashMap<Integer, HashMap<String, Object>> cart, int id) {

        if (cart.containsKey(id)) {
            return null;
        }

        HashMap<String, Object> item = new HashMap<>();
        DB db = new DB();

        try {
            ResultSet rs = db.getProduct(Integer.toString(id));
            rs.next();
            
            float new_price = rs.getFloat("price") * (100 - rs.getFloat("discount")) / 100;
            
            item.put("id", rs.getInt("productId"));
            item.put("name", rs.getString("name"));
            item.put("price", new_price);
            item.put("old_price", rs.getFloat("price"));
            item.put("discount", rs.getFloat("discount"));
            item.put("available_count", rs.getInt("availableCount"));
            item.put("brand", rs.getString("shortDescription"));
            item.put("photo", rs.getString("photo"));
            item.put("items", 1);
            cart.put(id, item);

            return cart;

        } catch (SQLException ex) {
            return null;
        }
    }
}
