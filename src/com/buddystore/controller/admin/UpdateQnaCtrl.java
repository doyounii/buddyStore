package com.buddystore.controller.admin;

import com.buddystore.dto.Qna;
import com.buddystore.model.QnaDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateQnaCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        if(!sid.equals("admin") || sid==null){
            response.sendRedirect(request.getContextPath());
        }

        String msg = "qna 내용을 수정합니다.";
        int qno = Integer.parseInt(request.getParameter("qno"));

        QnaDAO dao = new QnaDAO();
        Qna qna = dao.getQna(qno);

        request.setAttribute("msg", msg);
        request.setAttribute("qna", qna);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/updateQna.jsp");
        view.forward(request,response);
    }
}
