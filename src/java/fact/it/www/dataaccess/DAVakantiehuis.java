package fact.it.www.dataaccess;

import fact.it.www.beans.Vakantiehuis;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAVakantiehuis {

    private final String url, login, password;

    public DAVakantiehuis(String url, String login, String password, String driver) throws ClassNotFoundException {
        Class.forName(driver);
        this.url = url;
        this.login = login;
        this.password = password;
    }

   

}
