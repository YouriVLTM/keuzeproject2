package fact.it.www.dataaccess;

import fact.it.www.beans.Periode;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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

}
