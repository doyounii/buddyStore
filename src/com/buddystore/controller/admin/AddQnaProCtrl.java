package com.buddystore.controller.admin;

import com.buddystore.dto.Qna;
import com.buddystore.model.QnaDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddQnaPro.do")

public class AddQnaProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String title = request.getParameter("title");
        //String content = request.getParameter("content");

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        if(!sid.equals("admin") || sid==null){
            response.sendRedirect(request.getContextPath());
        }

        Qna qna = new Qna();
        qna.setTitle(request.getParameter("title"));
        qna.setContent(request.getParameter("content"));
        qna.setAuthor(request.getParameter("author"));

        PrintWriter out = response.getWriter();

        QnaDAO dao = new QnaDAO();
        int a = dao.addQna(qna);
        if(a>0) {
            response.sendRedirect(request.getContextPath()+"/QnaList.do");
        } else {
            //request.sendRedirect("/AddNotice.do");
            out.println("<script>history.go(-1);</script>");
        }
    }
}
