package fact.it.www.dataaccess;


import fact.it.www.beans.Periode;
import java.sql.Connection;
import java.sql.DriverManager;
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

    

}
