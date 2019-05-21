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
                park.setRegioid(resultSet.getInt("regioid"));
                park.setAantalSterren(resultSet.getInt("aantalSterren"));
                park.setVoorzieningen(resultSet.getString("voorzieningen"));
                park.setFoto(resultSet.getString("foto"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return park;
    }
    
    
    public Park getPark(String naam) {
        Park park = null;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM park where lower(naam) like ?");     ) {
                naam = naam.toLowerCase();
                statement.setString(1, naam + "%");
                ResultSet resultSet = statement.executeQuery();
           
            if (resultSet.next()) {
                park = new Park();
                park.setId(resultSet.getInt("id"));
                park.setNaam(resultSet.getString("naam"));
                park.setRegioid(resultSet.getInt("regioid"));
                park.setAantalSterren(resultSet.getInt("aantalSterren"));
                park.setVoorzieningen(resultSet.getString("voorzieningen"));
                park.setFoto(resultSet.getString("foto"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return park;
    }
    
        public ArrayList<Park> getParken() {        
        ArrayList<Park> parken = new ArrayList<>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM park ORDER BY naam ASC");     ) {
                
           
            while (resultSet.next()) {
                Park park = new Park();                
                park.setId(resultSet.getInt("id"));
                park.setNaam(resultSet.getString("naam"));
                park.setRegioid(resultSet.getInt("regioid"));
                park.setAantalSterren(resultSet.getInt("aantalSterren"));
                park.setVoorzieningen(resultSet.getString("voorzieningen"));
                park.setFoto(resultSet.getString("foto"));
                // arralist
                parken.add(park);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return parken;
    }
        
public Park getParkId(int parkId) {
        Park park = null;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM park where id = ?");     ) {
                
                statement.setInt(1, parkId);
                ResultSet resultSet = statement.executeQuery();
           
            if (resultSet.next()) {
                park = new Park();
                park.setId(resultSet.getInt("id"));
                park.setNaam(resultSet.getString("naam"));
                park.setRegioid(resultSet.getInt("regioid"));
                park.setAantalSterren(resultSet.getInt("aantalSterren"));
                park.setVoorzieningen(resultSet.getString("voorzieningen"));
                park.setFoto(resultSet.getString("foto"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return park;
    }

public ArrayList<Park> getAantalSterren(int aantalSterren) {    
        ArrayList<Park> parken = new ArrayList<>();

        try (
                 Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM park where aantalSterren = ?");     ) {
                
           
            statement.setInt(1, aantalSterren);
            ResultSet resultSet = statement.executeQuery();
                
            while (resultSet.next()) {
                Park park = new Park();                
                park.setId(resultSet.getInt("id"));
                park.setNaam(resultSet.getString("naam"));
                park.setRegioid(resultSet.getInt("regioid"));
                park.setAantalSterren(resultSet.getInt("aantalSterren"));
                park.setVoorzieningen(resultSet.getString("voorzieningen"));
                park.setFoto(resultSet.getString("foto"));
                // arralist
                parken.add(park);
                
            }
            // standaar staat de arraylist bij null elementen op 0 -> Maar moet opgevormd worden naar null
            if(parken.isEmpty()){
                parken = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return parken;
    }

public ArrayList<Park> getParksByRegio(int regioId) {
        Park park = null;
        ArrayList<Park> parken = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("select * from park join regio on park.regioid = regio.id where regio.id = ?");) {

            statement.setInt(1, regioId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                park = new Park();
                park.setId(resultSet.getInt("id"));
                park.setNaam(resultSet.getString("naam"));
                park.setRegioid(resultSet.getInt("regioid"));
                park.setAantalSterren(resultSet.getInt("aantalSterren"));
                park.setVoorzieningen(resultSet.getString("voorzieningen"));
                park.setFoto(resultSet.getString("foto"));
                
                parken.add(park);
            }
             // standaar staat de arraylist bij null elementen op 0 -> Maar moet opgevormd worden naar null
            if(parken.isEmpty()){
                parken = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return parken;
    }

    

    
   
}
