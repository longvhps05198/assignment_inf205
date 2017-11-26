/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.ConnectionData;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hlong232
 */
public class LoginBean implements Serializable{

    private int ID;
    private String username;
    private String password;
    private String role = "";
    Connection conn;

    public LoginBean(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public LoginBean() {
        
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
    
    public String checkLogin(String username, String password) {
        try {
            conn = new ConnectionData().connectData("PS05198_Assignment");
            String sql = "select * from USER_ACCOUNT where Username = ? and Password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            boolean result = rs.next();
            if (result) {
                role = rs.getString(4);
            }
            rs.close();
            ps.close();
            conn.close();
            return role;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }
}
