package com.buddystore.model;
import com.buddystore.dto.Test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TestDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String sql = "select * from notice";
    public List<Test> getTestList(){
        List<Test> testList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            if(conn!=null){
                System.out.println("MariaDB 연결 성공");
            }
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Test test = new Test();
                test.setNo(rs.getInt("no"));
                test.setTitle(rs.getString("title"));
                test.setContent(rs.getString("content"));
                testList.add(test);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return testList;
    }
}
