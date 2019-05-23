package fact.it.www.dataaccess;

import fact.it.www.beans.Park;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Hashtable;

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
     
    public ArrayList<Park> getParkNaam(String naam) {
       ArrayList<Park> parken = new ArrayList<>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM park where lower(naam) like ?");     ) {
                naam = naam.toLowerCase();
                statement.setString(1, "%" + naam + "%");
                ResultSet resultSet = statement.executeQuery();
           
            if (resultSet.next()) {
                Park park = new Park();
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
            // standaar staat de arraylist bij null elementen op 0 -> Maar moet opgevormd worden naar null
            if(parken.isEmpty()){
                parken = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return parken;
    }
        
    public Hashtable<Integer, Park> getAlleParkenHash() {
        Park park = null;
        Hashtable<Integer, Park> parken = new Hashtable<Integer, Park>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM park");) {
            while (resultSet.next()) {
                park = new Park();                
                park.setId(resultSet.getInt("id"));
                park.setNaam(resultSet.getString("naam"));
                park.setRegioid(resultSet.getInt("regioid"));
                park.setAantalSterren(resultSet.getInt("aantalSterren"));
                park.setVoorzieningen(resultSet.getString("voorzieningen"));
                park.setFoto(resultSet.getString("foto"));
                //put in hash table
                parken.put(park.getId(),park);
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

public ArrayList<Park> getParkAantalSlaapkamers(int aantalSlaapkamers) {
        Park park = null;
        ArrayList<Park> parken = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM Park where park.ID IN ( select PARKID from vakantiehuis where AANTALSLAAPKAMERS = ?)");) {

            statement.setInt(1, aantalSlaapkamers);
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

public ArrayList<Park> getParkAantalPersonen(int aantalPersonen) {
        Park park = null;
        ArrayList<Park> parken = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM Park where park.ID IN ( select PARKID from vakantiehuis where AANTALPERSONEN = ?)");) {

            statement.setInt(1, aantalPersonen);
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

    public ArrayList<Park> getParkFilter(int aantalSterren,int regioId,String parkNaam,int aantalSlaapkamers,int aantalPersonen) {
        Park park = null;
        ArrayList<Park> parken = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("select * from park\n" +
                                                                            "where park.id IN \n" +
                                                                            "    (select vakantiehuis.PARKID from vakantiehuis \n" +
                                                                            "     where VAKANTIEHUIS.aantalSlaapKamers = \n" +
                                                                            "            CASE\n" +
                                                                            "                WHEN ? > 0 then ?\n" +
                                                                            "                ELSE nvl(null,VAKANTIEHUIS.aantalSlaapkamers)\n" +
                                                                            "            END\n" +
                                                                            "            AND VAKANTIEHUIS.aantalPersonen = CASE\n" +
                                                                            "                WHEN ? > 0 then ?\n" +
                                                                            "                ELSE nvl(null,VAKANTIEHUIS.aantalPersonen)\n" +
                                                                            "            END\n" +
                                                                            "    )\n" +
                                                                            "\n" +
                                                                            "AND park.REGIOID = \n" +
                                                                            "    CASE\n" +
                                                                            "        WHEN ? > 0 then ?\n" +
                                                                            "        ELSE nvl(null,REGIOID)\n" +
                                                                            "    END \n" +
                                                                            "AND park.naam = nvl(?,park.naam)\n" +
                                                                            "AND park.aantalSterren = \n" +
                                                                            "    CASE\n" +
                                                                            "        WHEN ? > 0 then ?\n" +
                                                                            "        ELSE nvl(null,aantalSterren)\n" +
                                                                            "    END \n" +
                                                                            "");) {

            
            
           
            statement.setInt(1, aantalSlaapkamers);
            statement.setInt(2, aantalSlaapkamers);
            statement.setInt(3, aantalPersonen);
            statement.setInt(4, aantalPersonen);
            statement.setInt(5, regioId);
            statement.setInt(6, regioId);
            statement.setString(7, parkNaam);
            statement.setInt(8, aantalSterren);
            statement.setInt(9, aantalSterren);

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
    
    public boolean zoekParkNaam(String parknaam) {
        boolean exist = false;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM park where lower(naam) = ?");     ) {
                
                statement.setString(1, parknaam);
                ResultSet resultSet = statement.executeQuery();
           
            if (resultSet.next()) {
                exist = true;
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exist;
    }
    
        public boolean insertPark(String parknaam,int regioId,int aantalSterren,String voorzieningen,String fotonaam) {
        boolean resultaat = true;

        try (Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement
                = connection.prepareStatement("insert into park values (park_seq.nextval,?,?,?,?,?)");) {
            statement.setString(1, parknaam);
            statement.setInt(2, regioId);
            statement.setInt(3, aantalSterren);
            statement.setString(4, voorzieningen);
            statement.setString(5, fotonaam);

            statement.executeUpdate();
        } catch (Exception e) {
            resultaat = false;
            e.printStackTrace();
        }
        return resultaat;
    }
        
    public boolean deletePark(int parkId) {
        boolean resultaat = true;

        try (Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement
                = connection.prepareStatement("delete from park where id = ?");) {
            statement.setInt(1, parkId);
            statement.executeUpdate();
        } catch (Exception e) {
            resultaat = false;
            e.printStackTrace();
        }
        return resultaat;
    }
    
        public boolean updatePark(int parkId, String parknaam,int regioId,int aantalSterren, String voorzieningen, String fotonaam) {
        boolean resultaat = true;

        try (Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement
                = connection.prepareStatement("update park set naam=?, regioid=?, aantalsterren=?, voorzieningen=?, foto=?  where id=?");) {
            
            statement.setString(1, parknaam);
            statement.setInt(2, regioId);
            statement.setInt(3, aantalSterren);
            statement.setString(4, voorzieningen);
            statement.setString(5, fotonaam);
            statement.setInt(6, parkId);
            statement.executeUpdate();
        } catch (Exception e) {
            resultaat = false;
            e.printStackTrace();
        }
        return resultaat;
    }
        
       
    

    
    
    
   
}
