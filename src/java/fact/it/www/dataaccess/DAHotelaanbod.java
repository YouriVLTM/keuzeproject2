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
    
    

}
