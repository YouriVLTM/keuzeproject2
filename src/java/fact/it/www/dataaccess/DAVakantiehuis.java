package fact.it.www.dataaccess;

import fact.it.www.beans.Vakantiehuis;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DAVakantiehuis {

    private final String url, login, password;

    public DAVakantiehuis(String url, String login, String password, String driver) throws ClassNotFoundException {
        Class.forName(driver);
        this.url = url;
        this.login = login;
        this.password = password;
    }
    
       public ArrayList<Vakantiehuis> getVakantiehuizen() {        
        ArrayList<Vakantiehuis> vakantiehuizen = new ArrayList<>();

        try (
                  Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM vakantiehuis");     ) {
                
            
            while (resultSet.next()) {
                Vakantiehuis vakantiehuis = new Vakantiehuis();   
                vakantiehuis.setId(resultSet.getInt("id"));
                vakantiehuis.setParkid(resultSet.getInt("parkid"));
                vakantiehuis.setType(resultSet.getString("type"));
                vakantiehuis.setAantalSlaapkamers(resultSet.getInt("aantalSlaapkamers"));
                vakantiehuis.setAantalPersonen(resultSet.getInt("aantalPersonen"));
                vakantiehuis.setOppervlakte(resultSet.getInt("oppervlakte"));

                // arralist
                vakantiehuizen.add(vakantiehuis);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vakantiehuizen;
    }
       
    public Vakantiehuis getVakantiehuizenById(int vakantiehuisId) {        
        Vakantiehuis vakantiehuis = null;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM vakantiehuis where id = ?");     ) {
                
                statement.setInt(1, vakantiehuisId);
                ResultSet resultSet = statement.executeQuery();
           
            if (resultSet.next()) {
                vakantiehuis = new Vakantiehuis();
                vakantiehuis.setId(resultSet.getInt("id"));
                vakantiehuis.setParkid(resultSet.getInt("parkid"));
                vakantiehuis.setType(resultSet.getString("type"));
                vakantiehuis.setAantalSlaapkamers(resultSet.getInt("aantalSlaapkamers"));
                vakantiehuis.setAantalPersonen(resultSet.getInt("aantalPersonen"));
                vakantiehuis.setOppervlakte(resultSet.getInt("oppervlakte"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vakantiehuis;
    }

   public ArrayList<Vakantiehuis> getVakantiehuizenByParkIdBeschikbaar(int parkId) {        
        ArrayList<Vakantiehuis> vakantiehuizen = new ArrayList<>();

        try (
                 Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM vakantiehuis where parkid = ?");     ) {
                
            statement.setInt(1, parkId);
            ResultSet resultSet = statement.executeQuery();
           
            while (resultSet.next()) {
                Vakantiehuis vakantiehuis = new Vakantiehuis();   
                vakantiehuis.setId(resultSet.getInt("id"));
                vakantiehuis.setParkid(resultSet.getInt("parkid"));
                vakantiehuis.setType(resultSet.getString("type"));
                vakantiehuis.setAantalSlaapkamers(resultSet.getInt("aantalSlaapkamers"));
                vakantiehuis.setAantalPersonen(resultSet.getInt("aantalPersonen"));
                vakantiehuis.setOppervlakte(resultSet.getInt("oppervlakte"));

                // arralist
                vakantiehuizen.add(vakantiehuis);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vakantiehuizen;
    }

           public boolean insertVakantiehuis(int parkId,String type,int aantalSlaapkamers,int aantalPersonen,int oppervlakte) {
        boolean resultaat = true;

        try (Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement
                = connection.prepareStatement("insert into vakantiehuis values (vakantiehuis_seq.nextval,?,?,?,?,?)");) {
            statement.setInt(1, parkId);
            statement.setString(2, type);
            statement.setInt(3, aantalSlaapkamers);
            statement.setInt(4, aantalPersonen);
            statement.setInt(5, oppervlakte);

            statement.executeUpdate();
        } catch (Exception e) {
            resultaat = false;
            e.printStackTrace();
        }
        return resultaat;
    }
           
    public boolean deleteVakantie(int vakantiehuisId) {
        boolean resultaat = true;

        try (Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement
                = connection.prepareStatement("delete from vakantiehuis where id = ?");) {
            statement.setInt(1, vakantiehuisId);
            statement.executeUpdate();
        } catch (Exception e) {
            resultaat = false;
            e.printStackTrace();
        }
        return resultaat;
    }
           
           
}
