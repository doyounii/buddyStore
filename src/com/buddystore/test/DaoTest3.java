package com.buddystore.test;

import com.buddystore.dto.Notice;
import com.buddystore.model.DBConnect;
import com.buddystore.model.MariaDBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class DaoTest3 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static Statement stmt = null;

    public static void main(String[] args) {
        Notice noti = new Notice();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "insert into notice values(default,?,?,default,default)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "DAO테스트1");
            pstmt.setString(2, "DAO테스트내용입니다.1");
            int cnt = pstmt.executeUpdate();
            if(cnt>0){
                System.out.println("1건의 레코드가 추가되었습니다.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
    }
}
