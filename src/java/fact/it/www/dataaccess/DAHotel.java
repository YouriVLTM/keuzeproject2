/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fact.it.www.dataaccess;

import fact.it.www.beans.Hotel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DAHotel {

    private final String url, login, password;

    public DAHotel(String url, String login, String password, String driver) throws ClassNotFoundException {
        Class.forName(driver);
        this.url = url;
        this.login = login;
        this.password = password;
    }

    public Hotel getHotel() {
        Hotel hotel = null;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM hotel where id = 1");) {
            if (resultSet.next()) {
                hotel = new Hotel();
                hotel.setId(resultSet.getInt("id"));
                hotel.setNaam(resultSet.getString("naam"));
                hotel.setAantalSterren(resultSet.getInt("aantalSterren"));
                hotel.setLigging(resultSet.getString("ligging"));
                hotel.setMaaltijden(resultSet.getString("maaltijden"));
                hotel.setOntspanning(resultSet.getString("ontspanning"));
                hotel.setFoto(resultSet.getString("foto"));
                hotel.setRegioid(resultSet.getInt("regioid"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotel;
    }

    public Hotel getHotel(String deelnaam) {
        Hotel hotel = null;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM hotel where lower(naam) like ?");) {

            statement.setString(1, "%" + deelnaam + "%");
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                hotel = new Hotel();
                hotel.setId(resultSet.getInt("id"));
                hotel.setNaam(resultSet.getString("naam"));
                hotel.setAantalSterren(resultSet.getInt("aantalSterren"));
                hotel.setLigging(resultSet.getString("ligging"));
                hotel.setMaaltijden(resultSet.getString("maaltijden"));
                hotel.setOntspanning(resultSet.getString("ontspanning"));
                hotel.setFoto(resultSet.getString("foto"));
                hotel.setRegioid(resultSet.getInt("regioid"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotel;
    }

    public ArrayList<Hotel> getAlleHotels() {
        Hotel hotel = null;
        ArrayList<Hotel> hotels = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM hotel order by naam");) {
            
            while (resultSet.next()) {
                hotel = new Hotel();
                hotel.setId(resultSet.getInt("id"));
                hotel.setNaam(resultSet.getString("naam"));
                hotel.setAantalSterren(resultSet.getInt("aantalSterren"));
                hotel.setLigging(resultSet.getString("ligging"));
                hotel.setMaaltijden(resultSet.getString("maaltijden"));
                hotel.setOntspanning(resultSet.getString("ontspanning"));
                hotel.setFoto(resultSet.getString("foto"));
                hotel.setRegioid(resultSet.getInt("regioid"));
                hotels.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotels;
    }
     public Hotel getHotelById(int hotelId) {
        Hotel hotel = null;
    
        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("select * from hotel where id = ?");) {

            statement.setInt(1, hotelId);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                hotel = new Hotel();
                hotel.setId(resultSet.getInt("id"));
                hotel.setNaam(resultSet.getString("naam"));
                hotel.setAantalSterren(resultSet.getInt("aantalSterren"));
                hotel.setLigging(resultSet.getString("ligging"));
                hotel.setMaaltijden(resultSet.getString("maaltijden"));
                hotel.setOntspanning(resultSet.getString("ontspanning"));
                hotel.setFoto(resultSet.getString("foto"));
                hotel.setRegioid(resultSet.getInt("regioid"));
              
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotel;
    }
     public ArrayList<Hotel> getHotelsByAantalSterren(int aantalSterren) {
        Hotel hotel = null;
        ArrayList<Hotel> hotels = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM hotel where aantalSterren = ?");) {

            statement.setInt(1, aantalSterren);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                hotel = new Hotel();
                hotel.setId(resultSet.getInt("id"));
                hotel.setNaam(resultSet.getString("naam"));
                hotel.setAantalSterren(resultSet.getInt("aantalSterren"));
                hotel.setLigging(resultSet.getString("ligging"));
                hotel.setMaaltijden(resultSet.getString("maaltijden"));
                hotel.setOntspanning(resultSet.getString("ontspanning"));
                hotel.setFoto(resultSet.getString("foto"));
                hotel.setRegioid(resultSet.getInt("regioid"));
                hotels.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotels;
    }
     public ArrayList<Hotel> getHotelsByRegio(int regioId) {
        Hotel hotel = null;
        ArrayList<Hotel> hotels = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("select * from hotel join regio on hotel.regioid = regio.id where regio.id = ?");) {

            statement.setInt(1, regioId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                hotel = new Hotel();
                hotel.setId(resultSet.getInt("id"));
                hotel.setNaam(resultSet.getString("naam"));
                hotel.setAantalSterren(resultSet.getInt("aantalSterren"));
                hotel.setLigging(resultSet.getString("ligging"));
                hotel.setMaaltijden(resultSet.getString("maaltijden"));
                hotel.setOntspanning(resultSet.getString("ontspanning"));
                hotel.setFoto(resultSet.getString("foto"));
                hotel.setRegioid(resultSet.getInt("regioid"));
                hotels.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotels;
    }
     public ArrayList<Hotel> getHotelsByNaam(String hotelNaam) {
        Hotel hotel = null;
        ArrayList<Hotel> hotels = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM hotel where lower(naam) like ?");) {

            statement.setString(1, "%" + hotelNaam + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                hotel = new Hotel();
                hotel.setId(resultSet.getInt("id"));
                hotel.setNaam(resultSet.getString("naam"));
                hotel.setAantalSterren(resultSet.getInt("aantalSterren"));
                hotel.setLigging(resultSet.getString("ligging"));
                hotel.setMaaltijden(resultSet.getString("maaltijden"));
                hotel.setOntspanning(resultSet.getString("ontspanning"));
                hotel.setFoto(resultSet.getString("foto"));
                hotel.setRegioid(resultSet.getInt("regioid"));
                hotels.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotels;
    }
     public ArrayList<Hotel> getHotelsByPeriode(int periodeId) {
        Hotel hotel = null;
        ArrayList<Hotel> hotels = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("select * from hotel h join hotelaanbod ha on h.id = ha.hotelid join periode p on ha.periodeid = p.id where p.id = ?");) {

            statement.setInt(1, periodeId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                hotel = new Hotel();
                hotel.setId(resultSet.getInt("id"));
                hotel.setNaam(resultSet.getString("naam"));
                hotel.setAantalSterren(resultSet.getInt("aantalSterren"));
                hotel.setLigging(resultSet.getString("ligging"));
                hotel.setMaaltijden(resultSet.getString("maaltijden"));
                hotel.setOntspanning(resultSet.getString("ontspanning"));
                hotel.setFoto(resultSet.getString("foto"));
                hotel.setRegioid(resultSet.getInt("regioid"));
                hotels.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotels;
    }

     public ArrayList<String> getMaaltijden() {
        String maaltijd = null;
        ArrayList<String> maaltijden = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT distinct maaltijden FROM hotel");) {

            while (resultSet.next()) {
                maaltijd = resultSet.getString("maaltijden");
                maaltijden.add(maaltijd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return maaltijden;
    }
     
     
     public ArrayList<Hotel> getHotelsByMaaltijd(String zoekMaaltijd) {
        Hotel hotel = null;
        ArrayList<Hotel> hotels = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("select * from hotel where maaltijden =  ?");) {

            statement.setString(1,zoekMaaltijd);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                hotel = new Hotel();
                hotel.setId(resultSet.getInt("id"));
                hotel.setNaam(resultSet.getString("naam"));
                hotel.setAantalSterren(resultSet.getInt("aantalSterren"));
                hotel.setLigging(resultSet.getString("ligging"));
                hotel.setMaaltijden(resultSet.getString("maaltijden"));
                hotel.setOntspanning(resultSet.getString("ontspanning"));
                hotel.setFoto(resultSet.getString("foto"));
                hotel.setRegioid(resultSet.getInt("regioid"));
                hotels.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotels;
     }
     
     
      public ArrayList<Hotel> getHotelsByOntspanning(String zoekOntspanning) {
        Hotel hotel = null;
        ArrayList<Hotel> hotels = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM hotel where lower(ontspanning) like ?");) {

            statement.setString(1, "%" + zoekOntspanning + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                hotel = new Hotel();
                hotel.setId(resultSet.getInt("id"));
                hotel.setNaam(resultSet.getString("naam"));
                hotel.setAantalSterren(resultSet.getInt("aantalSterren"));
                hotel.setLigging(resultSet.getString("ligging"));
                hotel.setMaaltijden(resultSet.getString("maaltijden"));
                hotel.setOntspanning(resultSet.getString("ontspanning"));
                hotel.setFoto(resultSet.getString("foto"));
                hotel.setRegioid(resultSet.getInt("regioid"));
                hotels.add(hotel);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotels;
    }
    
}
