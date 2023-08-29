package com.buddystore.controller.admin;

import com.buddystore.dto.Delivery;
import com.buddystore.model.DeliveryDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AdminUpdateDeliveryPro.do")
public class AdminUpdateDeliveryProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        if(!sid.equals("admin") || sid==null){
            response.sendRedirect(request.getContextPath());
        }

        Delivery del = new Delivery();

        del.setDno(Integer.parseInt(request.getParameter("dno")));
        del.setPcom(request.getParameter("pcom"));
        del.setPtel(request.getParameter("ptel"));
        del.setSdate(request.getParameter("sdate"));
        del.setRdate(request.getParameter("rdate"));
        del.setBcode(request.getParameter("bcode"));

        DeliveryDAO dao = new DeliveryDAO();
        int cnt = dao.deliveryPro(del);

        PrintWriter out = response.getWriter();

        if(cnt>0){
            response.sendRedirect(request.getContextPath()+"/AdminDeliveryList.do?dno="+request.getParameter("dno"));
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
