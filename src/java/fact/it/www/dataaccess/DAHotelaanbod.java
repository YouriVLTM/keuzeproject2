/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fact.it.www.dataaccess;

import fact.it.www.beans.Hotelaanbod;
import fact.it.www.beans.Huisaanbod;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAHotelaanbod {
     private final String url, login, password;


    public DAHotelaanbod(String url, String login, String password, String driver) throws ClassNotFoundException {
        Class.forName(driver);
        this.url = url;
        this.login = login;
        this.password = password;
    }
    public ArrayList<Hotelaanbod> getHotelPrijs(int hotelid) {
        Hotelaanbod hotelaanbod = null;
        ArrayList<Hotelaanbod> hotelaanbiedingen = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("select * from hotelaanbod h join periode p on h.periodeid = p.id where h.hotelid = ?");) {

            statement.setInt(1, hotelid);
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                hotelaanbod = new Hotelaanbod();
                hotelaanbod.setId(resultSet.getInt("id"));
                hotelaanbod.setHotelid(resultSet.getInt("hotelid"));                
                hotelaanbod.setPeriodeid(resultSet.getInt("periodeid"));
                hotelaanbod.setPrijsperdag(resultSet.getInt("prijsperdag"));
                hotelaanbiedingen.add(hotelaanbod);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotelaanbiedingen;
    }
    
    

}
