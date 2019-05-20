package fact.it.www.dataaccess;

import fact.it.www.beans.Regio;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DARegio {

    private final String url, login, password;

    public DARegio(String url, String login, String password, String driver) throws ClassNotFoundException {
        Class.forName(driver);
        this.url = url;
        this.login = login;
        this.password = password;
    }

    public Regio getRegio() {
        Regio regio = null;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM regio where id = 1");) {
            if (resultSet.next()) {
                regio = new Regio();
                regio.setId(resultSet.getInt("id"));
                regio.setNaam(resultSet.getString("naam"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return regio;
    }
    public Regio getRegionaamByHotelId(int hotelId) {
        Regio regio = null;
    
        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("select * from regio join hotel on regio.id = hotel.regioid where hotel.id = ?");) {

            statement.setInt(1, hotelId);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                regio = new Regio();
                regio.setId(resultSet.getInt("id"));
                regio.setNaam(resultSet.getString("naam"));
              
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return regio;
    }
    public ArrayList<Regio> getAlleRegios() {
        Regio regio = null;
        ArrayList<Regio> regios = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM regio");) {
            while (resultSet.next()) {
                regio = new Regio();
                regio.setId(resultSet.getInt("id"));
                regio.setNaam(resultSet.getString("naam"));
                regios.add(regio);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return regios;
    }



}
