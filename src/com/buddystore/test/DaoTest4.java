package com.buddystore.test;

import com.buddystore.model.DBConnect;
import com.buddystore.model.PostgreCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoTest4 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;

    public static void main(String[] args) {
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "update notice set title=?, content=? where no=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "수정 DAO테스트1");
            pstmt.setString(2, "수정 DAO테스트내용입니다.1");
            pstmt.setInt(3, 3);
            int cnt = pstmt.executeUpdate();
            if(cnt>0){
                System.out.println("1건의 레코드가 변경되었습니다.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
    }
}
