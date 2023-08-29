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
        Delivery del = new Delivery();

        del.setDno(Integer.parseInt(request.getParameter("dno")));
        del.setSno(Integer.parseInt(request.getParameter("sno")));
        del.setCid(request.getParameter("cid"));
        del.setDaddr(request.getParameter("daddr"));
        del.setCustel(request.getParameter("custel"));
        del.setPcom(request.getParameter("pcom"));
        del.setPtel(request.getParameter("ptel"));
        del.setPstate(Integer.parseInt(request.getParameter("pstate")));
        del.setSdate(request.getParameter("sdate"));
        del.setRdate(request.getParameter("rdate"));
        del.setBcode(request.getParameter("bcode"));

        DeliveryDAO dao = new DeliveryDAO();
        int cnt = dao.deliveryPro(del);


        PrintWriter out = response.getWriter();

        if(cnt>0){
            response.sendRedirect(request.getContextPath()+"/AdminDeliveryList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
