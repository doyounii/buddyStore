package com.buddystore.controller.event;

import com.buddystore.dto.Winner;
import com.buddystore.model.WinnerDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Winner.do")
public class WinnerCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no = Integer.parseInt(request.getParameter("no"));
        WinnerDAO dao = new WinnerDAO();
        Winner winner = dao.getWinner(no);
        request.setAttribute("winner", winner);
        RequestDispatcher view = request.getRequestDispatcher("/event/getWinner.jsp");
        view.forward(request, response);
    }
}
