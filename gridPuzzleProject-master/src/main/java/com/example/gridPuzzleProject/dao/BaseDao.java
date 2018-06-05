package com.example.gridPuzzleProject.dao;

import java.sql.*;

public class BaseDao {

    private static String driver;
    private static String url;
    private static String username;
    private static String password;

    public static void init(String driver, String url, String username, String password) {
        BaseDao.driver = driver;
        BaseDao.url = url;
        BaseDao.username = username;
        BaseDao.password = password;
    }

    protected ResultSet executeQuery(String query) throws SQLException {
        try {
            Class.forName(driver).newInstance();
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            System.err.println("Can't load driver. Verify CLASSPATH");
            System.err.println(e.getMessage());
        }

        Connection connection = DriverManager.getConnection(url, username, password);
        Statement statement = connection.createStatement();
        return statement.executeQuery(query);
    }
}
