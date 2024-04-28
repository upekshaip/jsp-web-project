package admin;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddProductServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
      throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "username", "password");

            String sql = "INSERT INTO products (name, price) VALUES (?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, request.getParameter("name"));
            stmt.setDouble(2, Double.parseDouble(request.getParameter("price")));

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
