package com.buddystore.model;

import java.sql.*;

public class MariaDBCon implements DBConnect {

    final String DRIVER = "org.mariadb.jdbc.Driver";
    final String URL = "jdbc:mariadb://localhost:3306/weekstore";
    final String USER = "root";
    final String PASS = "1234";
    Connection conn = null;

    @Override
    public Connection connect() {
        try {
            Class.forName(DRIVER);
            try {
                conn = DriverManager.getConnection(URL, USER, PASS);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return conn;
    }

    @Override
    public void close(PreparedStatement pstmt, Connection conn) {
        if(pstmt!=null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if(conn!=null) {
            try {
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if(pstmt!=null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if(conn!=null) {
            try {
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
