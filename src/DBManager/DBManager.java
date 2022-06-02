package DBManager;

import Entities.Foods;
import Entities.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class DBManager {

    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaee_db?useUnicode=true&serverTimezone=UTC", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static User getUser(String email) {
        User user = null;

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM  users " +
                    "WHERE email = ?" +
                    "");
            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("surname"),
                        resultSet.getString("email"),
                        resultSet.getString("password")
                );

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static void addFood(Foods food) {
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO foods (user_id, name, photo, description, price, paste_date)" +
                    "VALUES (?, ?, ?, ?, ?, NOW())");
            statement.setLong(1, food.getUser().getId());
            statement.setString(2, food.getName());
            statement.setString(3, food.getPhoto());
            statement.setString(4, food.getDescription());
            statement.setLong(5, food.getPrice());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Foods> getAllFoods() {
        ArrayList<Foods> foods = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT f.id, f.user_id, f.name as foodName, f.photo, f.description, f.paste_date, f.price, u.name, u.surname, u.email" +
                    "FROM foods f " +
                    "INNER JOIN users u on u.id = f.user_id");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Foods food = new Foods();
                food.setName(resultSet.getString("foodName"));
                food.setPhoto(resultSet.getString("photo"));
                food.setDescription(resultSet.getString("description"));
                food.setPrice(Long.parseLong(resultSet.getString("price")));
                food.setPaste_date(resultSet.getTimestamp("paste_date"));

                User user = new User();
                user.setId(Long.parseLong(resultSet.getString("user_id")));
                user.setName(resultSet.getString("name"));
                user.setSurname(resultSet.getString("surname"));
                user.setEmail(resultSet.getString("email"));

                food.setUser(user);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return foods;
    }
}
