package com.buddystore.model;

import com.buddystore.dto.Cart;
import com.buddystore.dto.CartVO;
import com.buddystore.dto.Custom;
import com.buddystore.dto.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String sql = "";

    public int addCart(Cart cart){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.CART_INSERT);
            pstmt.setString(1, cart.getCid());
            pstmt.setInt(2, cart.getPno());
            pstmt.setInt(3, 1);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int delCart(int cartno){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.CART_DELETE);
            pstmt.setInt(1, cartno);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public List<CartVO> getByIdCartList(String cid){
        List<CartVO> cartList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.CART_SELECT_CID);
            pstmt.setString(1, cid);
            rs = pstmt.executeQuery();
            while(rs.next()){
                CartVO cart = new CartVO();
                cart.setCartno(rs.getInt("cartno"));
                cart.setCid(rs.getString("cid"));
                cart.setName(getCusName(cart.getCid()));
                cart.setPno(rs.getInt("pno"));
                cart.setPname(getPname(cart.getPno()));
                cart.setAmount(rs.getInt("amount"));
                cartList.add(cart);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return cartList;
    }

    public String getCusName(String id){
        CustomDAO dao = new CustomDAO();
        Custom cus = dao.getCustom(id);
        return cus.getName();
    }

    public String getPname(int pno){
        ProductDAO dao = new ProductDAO();
        Product pro = dao.getProduct(pno);
        return pro.getPname();
    }
}
