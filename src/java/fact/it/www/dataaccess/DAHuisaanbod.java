package fact.it.www.dataaccess;

import fact.it.www.beans.Huisaanbod;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAHuisaanbod {

    private final String url, login, password;

    public DAHuisaanbod(String url, String login, String password, String driver) throws ClassNotFoundException {
        Class.forName(driver);
        this.url = url;
        this.login = login;
        this.password = password;
    }

   
    public ArrayList<Huisaanbod> getHuisaanbodByVakantiehuisId(int vakantiehuisId) {        
        ArrayList<Huisaanbod> huisaanboden = new ArrayList <>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM huisaanbod\n" +
                                                        "JOIN vakantiehuis on huisaanbod.VAKANTIEHUISID = VAKANTIEHUIS.ID\n" +                                                        
                                                        "WHERE VAKANTIEHUIS.ID = ?");     
                ) {
                
                statement.setInt(1, vakantiehuisId);
                ResultSet resultSet = statement.executeQuery();
           
            while (resultSet.next()) {
                Huisaanbod huisaanbod = new Huisaanbod();
                huisaanbod.setId(resultSet.getInt("id"));
                huisaanbod.setVakantiehuisid(resultSet.getInt("vakantiehuisid"));
                huisaanbod.setPeriodeid(resultSet.getInt("periodeid"));
                huisaanbod.setPrijsperweek(resultSet.getInt("prijsperweek"));
                
                huisaanboden.add(huisaanbod);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return huisaanboden;
    }
}
