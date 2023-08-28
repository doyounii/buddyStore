package com.buddystore.controller.custom;

import com.buddystore.dto.Custom;
import com.buddystore.dto.PaymentVO;
import com.buddystore.model.CustomDAO;
import com.buddystore.model.PaymentDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/Mypage.do")
public class MypageCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");
        String cid = (String) session.getAttribute("sid");

        CustomDAO dao = new CustomDAO();
        Custom cus = dao.getCustom(id);

        System.out.println(cus.toString());

        request.setAttribute("cus", cus);


        PaymentDAO payDAO = new PaymentDAO();
        List<PaymentVO> payList = payDAO.getCidPaymentList(cid);


        request.setAttribute("payList", payList);
        RequestDispatcher view = request.getRequestDispatcher("/custom/mypage.jsp");
        view.forward(request, response);
    }
}
