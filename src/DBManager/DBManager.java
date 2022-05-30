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
       try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaee_db?useUnicode=true&serverTimezone=UTC", "root", "");
       }catch (Exception e){
           e.printStackTrace();
       }
   }

   public User getUser(String email){
       User user = null;

       try{
           PreparedStatement statement = connection.prepareStatement("" +
                   "SELECT * FROM  users" +
                   "WHERE email = ?" +
                   "");
           statement.setString(1, user.getEmail());

           ResultSet resultSet = statement.executeQuery();
           if (resultSet.next()){
               user = new User();
               user.setEmail(resultSet.getString("email"));
               user.setId(resultSet.getLong("id"));
               user.setName(resultSet.getString("name"));
               user.setSurname(resultSet.getString("surname"));
               user.setPassword(resultSet.getString("password"));

           }
       }catch(Exception e){
           e.printStackTrace();
       }
       return user;
   }

}
