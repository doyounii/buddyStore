package com.buddystore.controller.admin;

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
import java.util.List;

@WebServlet("/AdminDeliveryList.do")
public class AdminDeliveryListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DeliveryDAO dao = new DeliveryDAO();
        List<Delivery> deliveryList = dao.getDeliveryList();

        request.setAttribute("deliveryList", deliveryList);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/adminDeliveryList.jsp");
        view.forward(request, response);
    }
}
