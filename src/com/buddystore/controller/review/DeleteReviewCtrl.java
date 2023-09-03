package com.buddystore.controller.review;

import com.buddystore.model.ProductDAO;
import com.buddystore.model.ReviewDAO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteReview.do")
public class DeleteReviewCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pno = Integer.parseInt(request.getParameter("pno"));
        int rno = Integer.parseInt(request.getParameter("rno"));

        ServletContext application = request.getServletContext();
        String home = application.getContextPath();

        ReviewDAO dao = new ReviewDAO();
        int cnt = dao.delReview(rno);

        response.sendRedirect(home+"/Product.do?pno="+pno);
    }
}
