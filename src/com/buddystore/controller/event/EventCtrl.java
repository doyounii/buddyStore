package com.buddystore.controller.event;

import com.buddystore.dto.Event;
import com.buddystore.model.EventDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Event.do")
public class EventCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no = Integer.parseInt(request.getParameter("no"));
        EventDAO dao = new EventDAO();
        Event event = dao.getEvent(no);
        request.setAttribute("event", event);
        RequestDispatcher view = request.getRequestDispatcher("/event/getEvent.jsp");
        view.forward(request, response);
    }
}
