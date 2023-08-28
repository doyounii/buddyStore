package com.buddystore.controller.delivery;

import com.buddystore.dto.Delivery;
import com.buddystore.model.DeliveryDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Delivery.do")
public class DeliveryCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int sno = (int) session.getAttribute("sno");

        DeliveryDAO dao = new DeliveryDAO();
        Delivery delivery = dao.getBySnoDelivery(sno);

        request.setAttribute("delivery", delivery);
        RequestDispatcher view = request.getRequestDispatcher("/custom/delivery.jsp");
        view.forward(request, response);
    }
}
