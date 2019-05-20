package fact.it.www.dataaccess;

import fact.it.www.beans.Park;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DAPark {

    private final String url, login, password;


    public DAPark(String url, String login, String password, String driver) throws ClassNotFoundException {
        Class.forName(driver);
        this.url = url;
        this.login = login;
        this.password = password;
    }
    
    
    public Park getPark() {
        Park park = null;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM park where id = 1");) {
            if (resultSet.next()) {
                park = new Park();
                park.setId(resultSet.getInt("id"));
                park.setNaam(resultSet.getString("naam"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return park;
    }

   
}
