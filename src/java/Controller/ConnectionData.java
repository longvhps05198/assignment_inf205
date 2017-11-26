/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author hlong232
 */
public class ConnectionData {

    Connection conn;

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public Connection connectData(String dataname) {
        try {
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=" + dataname;
//            conn = DriverManager.getConnection(url, "sa", "123");
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://assignmentps05198.mssql.somee.com;databaseName=assignmentps05198";
            conn = DriverManager.getConnection(url, "longvhps05198_SQLLogin_1", "xx31gbq8qv");
            

//            Class.forName("com.mysql.jdbc.Driver");
//            String url = "jdbc:mysql://localhost:3306/Assignment_INF205_PS05198";
//            conn = DriverManager.getConnection(url, "root", "1234");
        } catch (Exception e) {

        }
        return conn;
    }
}
