package com.buddystore.controller.cart;

import com.buddystore.dto.Cart;
import com.buddystore.dto.CartVO;
import com.buddystore.dto.Notice;
import com.buddystore.model.CartDAO;
import com.buddystore.model.NoticeDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/CartList.do")
public class CartListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "장바구니 목록을 출력합니다.");

        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");

        CartDAO dao = new CartDAO();
        List<CartVO> cartList = dao.getByIdCartList(cid);

        request.setAttribute("cartList", cartList);
        RequestDispatcher view = request.getRequestDispatcher("/cart/cartList.jsp");
        view.forward(request, response);
    }
}
