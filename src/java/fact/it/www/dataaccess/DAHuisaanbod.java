package fact.it.www.dataaccess;

import fact.it.www.beans.Huisaanbod;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DAHuisaanbod {

    private final String url, login, password;

    public DAHuisaanbod(String url, String login, String password, String driver) throws ClassNotFoundException {
        Class.forName(driver);
        this.url = url;
        this.login = login;
        this.password = password;
    }

    public Huisaanbod getHuisaandbodId(int huisaanbodId) {
        Huisaanbod huisaanbod = null;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM huisaanbod where id = ?");) {

            statement.setInt(1, huisaanbodId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                huisaanbod = new Huisaanbod();
                huisaanbod.setId(resultSet.getInt("id"));
                huisaanbod.setVakantiehuisid(resultSet.getInt("vakantiehuisid"));
                huisaanbod.setPeriodeid(resultSet.getInt("periodeid"));
                huisaanbod.setPrijsperweek(resultSet.getInt("prijsperweek"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return huisaanbod;
    }

    public ArrayList<Huisaanbod> getHuisaanbodByVakantiehuisId(int vakantiehuisId) {
        ArrayList<Huisaanbod> huisaanboden = new ArrayList<>();

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement = connection.prepareStatement("SELECT * FROM huisaanbod\n"
                        + "JOIN vakantiehuis on huisaanbod.VAKANTIEHUISID = VAKANTIEHUIS.ID\n"
                        + "WHERE VAKANTIEHUIS.ID = ?");) {

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

    public boolean updateHuisaanbod(int huisaanbodId, int prijsperweek) {
        boolean resultaat = true;

        try (Connection connection = DriverManager.getConnection(url, login, password);
                PreparedStatement statement
                = connection.prepareStatement("update Huisaanbod set prijsperweek=?  where id=?");) {

            statement.setInt(1, prijsperweek);
            statement.setInt(2, huisaanbodId);
            statement.executeUpdate();
        } catch (Exception e) {
            resultaat = false;
            e.printStackTrace();
        }
        return resultaat;
    }

    public int getGrootstePrijs() {
        int prijs = 0;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select MAX(prijsperweek) As maxprijsperweek from huisaanbod");) {
            if (resultSet.next()) {
                prijs = resultSet.getInt("maxprijsperweek");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prijs;
    }

    public int getLaagstePrijs() {
        int prijs = 0;

        try (
                Connection connection = DriverManager.getConnection(url, login, password);
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select MIN(prijsperweek) As maxprijsperweek from huisaanbod");) {
            if (resultSet.next()) {
                prijs = resultSet.getInt("maxprijsperweek");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prijs;
    }

}
