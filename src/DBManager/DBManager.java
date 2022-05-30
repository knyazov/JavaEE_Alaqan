package DBManager;

import Entities.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

}
