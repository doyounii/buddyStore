package com.buddystore.controller.admin;

import com.buddystore.dto.Delivery;
import com.buddystore.model.DeliveryDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/AdminGetDelivery.do")
public class AdminGetDeliveryCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int dno = Integer.parseInt(request.getParameter("dno"));
        DeliveryDAO dao = new DeliveryDAO();
        Delivery del = dao.getDelivery(dno);
        request.setAttribute("del", del);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/adminGetDelivery.jsp");
        view.forward(request, response);
    }
}
