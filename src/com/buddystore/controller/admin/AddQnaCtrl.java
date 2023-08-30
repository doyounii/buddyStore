package com.buddystore.controller.admin;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/AddQna.do")
public class AddQnaCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        int lev = 0;
        int par = 0;

        if(!sid.equals("admin") || sid==null){
            response.sendRedirect(request.getContextPath());
        }

        String msg = "관리자의 QNA 글 등록폼이 로딩되었습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("lev", lev);
        request.setAttribute("par", par);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/addQna.jsp");
        view.forward(request, response);
    }
}
