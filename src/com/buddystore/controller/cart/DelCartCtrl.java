package com.buddystore.controller.cart;

import com.buddystore.model.CartDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DelCart.do")
public class DelCartCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] cartno = request.getParameterValues("cartno");

        CartDAO dao = new CartDAO();
        int cnt = 0;

        for(String cn:cartno) {
            int cno = Integer.parseInt(cn);
            cnt = cnt + dao.delCart(cno);
        }

        PrintWriter out = response.getWriter();

        if(cnt>0){
            response.sendRedirect(request.getContextPath()+"/CartList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
