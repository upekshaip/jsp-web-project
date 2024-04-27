package Config;

import java.sql.*;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DB {

    Config config = new Config();

    public Connection conn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:" + config.PORT + "/" + config.DB_NAME, "root", "");
            return conn;

        } catch (ClassNotFoundException | SQLException e) {
            return null;
        }
    }

    public int run_sql(String sql) {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();
            int x = stmt.executeUpdate(sql);
            return x;

        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public int checkUsername(String username) {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();

            String query = "SELECT COUNT(*) FROM users WHERE username = '" + username + "'";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int count = rs.getInt(1);
            return count;

        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public int checkEmail(String email) {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();

            String query = "SELECT COUNT(*) FROM users WHERE email = '" + email + "'";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            int count = rs.getInt(1);
            return count;

        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public int checkEmail2(String email, String username) {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();

            String query = "SELECT * FROM users WHERE email = '" + email + "'";
            ResultSet rs = stmt.executeQuery(query);
            int count = 0;
            int foundUser = 0;
            int others = 0;

            while (rs.next()) {
                count++;
                if (username.equals((String) rs.getString("username"))) {
                    foundUser++;
                } else {
                    others++;
                }
            }
            if (others > 0) {
                return 0;
            } else {
                return 1;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public int registerUser(String username, String password, String first_name, String last_name, String gender, String email) {
        String sql = "INSERT INTO users(username, email, password, first_name, last_name, gender) VALUES ('" + username + "', '" + email + "', '" + password + "', '" + first_name + "', '" + last_name + "', '" + gender + "')";
        int x = this.run_sql(sql);
        return x;
    }

    public HashMap loginUser(String username, String password) {
        HashMap<String, String> userMap = new HashMap<>();

        try {
            String sql = "SELECT * FROM users WHERE (username = '" + username + "' AND password = '" + password + "') OR (email = '" + username + "' AND password = '" + password + "');";
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();

            String first_name = rs.getString("first_name");
            String last_name = rs.getString("last_name");
            String _username = rs.getString("username");
            String _email = rs.getString("email");
            String gender = rs.getString("gender");
            int uid = rs.getInt("uid");

            userMap.put("uid", Integer.toString(uid));
            userMap.put("username", _username);
            userMap.put("email", _email);
            userMap.put("first_name", first_name);
            userMap.put("last_name", last_name);
            userMap.put("gender", gender);

            if (first_name != null && last_name != null && _username != null && _email != null && gender != null && uid > 0) {
                return userMap;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public HashMap updateUser(String username, String first_name, String last_name, String email, String gender) {
        HashMap<String, String> userMap = new HashMap<>();

        String sql = "UPDATE users SET first_name = '" + first_name + "', last_name = '" + last_name + "', email = '" + email + "', gender = '" + gender + "' WHERE username = '" + username + "';";
        int num = this.run_sql(sql);

        if (num > 0) {
            userMap.put("username", username);
            userMap.put("email", email);
            userMap.put("first_name", first_name);
            userMap.put("last_name", last_name);
            userMap.put("gender", gender);

            return userMap;
        } else {
            return null;
        }
    }

    public ResultSet getProducts() {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `products`");
            return rs;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public ResultSet getOrders(String user_id) {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `orders` WHERE userId = " + user_id + ";");
            return rs;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public ResultSet getAllOrders() {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `orders`;");
            return rs;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public ResultSet getAllUsers() {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `users`;");
            return rs;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public ResultSet getProduct(String id) {
        try {
            Connection conn = this.conn();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `products` WHERE productId = '" + id + "';");
            return rs;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public int reduceProductQuantity(String product_id, String new_count) {
        String sql = "UPDATE products SET availableCount = '" + new_count + "' WHERE productId = '" + product_id + "';";
        int num = this.run_sql(sql);
        if (num > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    public int updateOrderStatus(String order_id, String status) {
        String sql = "UPDATE `orders` SET status = '" + status + "' WHERE orderId = '" + order_id + "';";
        int num = this.run_sql(sql);
        if (num > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    public int placeOrder(int user_id, String username, HashMap<Integer, HashMap<String, Object>> cart) {

        if (cart.size() > 0) {
            for (int key : cart.keySet()) {
                HashMap value = cart.get(key);
                String my_user = Integer.toString(user_id);
                String id = Integer.toString((int) value.get("id"));
                String items = Integer.toString((int) value.get("items"));
                String all_count = Integer.toString((int) value.get("available_count"));
                String price = Float.toString((float) value.get("price"));
                String name = (String) value.get("name");
                String original = Float.toString((float) value.get("old_price"));
                String discount = Float.toString((float) value.get("discount"));

                int new_item_count = Integer.parseInt(all_count) - Integer.parseInt(items);
                String sql = "INSERT INTO `orders` (username, userId, productId, quantity, itemPrice, status, productName, original, discount) VALUES ('" + username + "','" + my_user + "','" + id + "','" + items + "','" + price + "' , 'Pending', '" + name + "', '" + original + "', '" + discount + "');";
                int x = this.run_sql(sql);
                if (x <= 0) {
                    return -1;
                }

//                ---- add the reduce items here ----
                int xx = this.reduceProductQuantity(id, Integer.toString(new_item_count));
                if (xx == 0) {
                    return -1;
                }
            }
            return 1;

        } else {
            return 0;
        }
    }

    public int addProduct(String product_name, String brand, String description, String price, String discount, String items, String photo) {
        String sql = "INSERT INTO products(name, description, shortDescription, price, discount, availableCount, photo) VALUES ('" + product_name + "', '" + description + "', '" + brand + "' , '" + price + "', '" + discount + "', '" + items + "', '" + photo + "')";
        int x = this.run_sql(sql);
        return x;
    }

    public int updateProduct(String product_id, String name, String description, String brand, String price, String discount, String items, String photo) {
        String sql = "UPDATE products SET name = '" + name + "', description = '" + description + "', shortDescription = '" + brand + "', price = '" + price + "', discount = '" + discount + "', availableCount = '" + items + "', photo = '" + photo + "' WHERE productId = '" + product_id + "';";
        int num = this.run_sql(sql);
        if (num > 0) {
            return 1;
        } else {
            return 0;
        }
    }
    public int contactus(String name, String email, String subject, String message) {
        String sql = "INSERT INTO contacts(name, email, subject, message) VALUES ('" + name + "', '" + email + "', '" + subject + "', '" + message + "');";
        int x = this.run_sql(sql);
        return x;
    }
}
