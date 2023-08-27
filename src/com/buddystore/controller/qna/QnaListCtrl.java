package com.buddystore.controller.qna;

import com.buddystore.dto.Qna;
import com.buddystore.model.QnaDAO;
import com.buddystore.util.Page;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/QnaList.do")
public class QnaListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "QNA 목록을 출력합니다.");

        QnaDAO dao = new QnaDAO();
        List<Qna> qnaList = dao.getQnaList();
        Page pg = new Page();
        int total = dao.getCount();
        pg.makeBlock(1);
        pg.makeLastPageNum();
        pg.makePostStart(1);
        qnaList = dao.getQnaList(0);

        int curPageNum = 1;
        if(request.getParameter("page")!=null){
            curPageNum = Integer.parseInt(request.getParameter("page"));
            pg.makeBlock(curPageNum);
            pg.makeLastPageNum();
            pg.makePostStart(curPageNum);
            qnaList = dao.getQnaList(pg.getPostStart()-1);
        }

        request.setAttribute("totalPageCount", pg.getTotalPageCount());
        request.setAttribute("pageBlockNum", pg.getPageBlockNum());
        request.setAttribute("totalBlockNum", pg.getTotalBlockNum());
        request.setAttribute("curPageNum", curPageNum);
        request.setAttribute("blockStartNum", pg.getBlockStartNum());
        request.setAttribute("blockLastNum", pg.getBlockLastNum());
        request.setAttribute("lastPageNum", pg.getLastPageNum());
        request.setAttribute("qnaList", qnaList);
        RequestDispatcher view = request.getRequestDispatcher("/qna/qnaList.jsp");
        view.forward(request, response);
    }
}
