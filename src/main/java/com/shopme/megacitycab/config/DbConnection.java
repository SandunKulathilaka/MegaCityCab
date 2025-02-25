package com.shopme.megacitycab.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    private static final String url = "jdbc:mysql://localhost:3306/MegaCityCab";
    private static final String user = "root";
    private static final String password = "";

    public static Connection getConnection () throws SQLException{
        try {
           Connection connection = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return DriverManager.getConnection(url, user, password);
    }

}
