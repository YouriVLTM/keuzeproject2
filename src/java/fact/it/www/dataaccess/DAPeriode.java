package fact.it.www.dataaccess;

import fact.it.www.beans.Periode;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Hashtable;

public class DAPeriode {

    private final String url, login, password;

    public DAPeriode(String url, String login, String password, String driver) throws ClassNotFoundException {
        Class.forName(driver);
        this.url = url;
        this.login = login;
        this.password = password;
    }

    public ArrayList<Periode> getHotelPrijs(int hotelid) {
        Periode periode = null;
        ArrayList<Periode> periodes = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("select * from periode join hotelaanbod h on periode.id = h.periodeid where h.hotelid = ?");) {

            statement.setInt(1, hotelid);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                periode = new Periode();
                periode.setId(resultSet.getInt("id"));
                periode.setNaam(resultSet.getString("naam"));
                periodes.add(periode);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return periodes;
    }
    public ArrayList<Periode> getAllePeriodes() {
        Periode periode = null;
        ArrayList<Periode> periodes = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM periode");) {
            while (resultSet.next()) {
                periode = new Periode();
                periode.setId(resultSet.getInt("id"));
                periode.setNaam(resultSet.getString("naam"));
                periodes.add(periode);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return periodes;
    }
    
    public ArrayList<Periode> getVanantiehuisPrijs(int vakantieId) {
        Periode periode = null;
        ArrayList<Periode> periodes = new ArrayList <>();

        try (
               Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT periode.ID,periode.NAAM FROM huisaanbod \n" +
                                                                    "Join Vakantiehuis on huisaanbod.VAKANTIEHUISID = VAKANTIEHUIS.ID\n" +
                                                                    "Join periode on HUISAANBOD.PERIODEID = PERIODE.ID\n" +
                                                                    "WHERE VAKANTIEHUISID = ?");) {
            
            
            statement.setInt(1, vakantieId);
            ResultSet resultSet = statement.executeQuery();
            
            
            while (resultSet.next()) {
                periode = new Periode();
                periode.setId(resultSet.getInt("id"));
                periode.setNaam(resultSet.getString("naam"));
                periodes.add(periode);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return periodes;
    }
    
    
        public Hashtable<Integer, Periode> getAllePeriodeHash() {
        Periode periode = null;
        Hashtable<Integer, Periode> periodes = new Hashtable<Integer, Periode>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM periode");) {
            while (resultSet.next()) {
                periode = new Periode();
                periode.setId(resultSet.getInt("id"));
                periode.setNaam(resultSet.getString("naam"));
                
                periodes.put(periode.getId(),periode);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return periodes;
    }

}
