package com.buddystore.controller.product;

import com.buddystore.model.ProductDAO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteProduct.do")
public class DeleteProductCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pno = Integer.parseInt(request.getParameter("pno"));

        String msg = "상품 정보를 삭제합니다.";
        ServletContext application = request.getServletContext();
        String home = application.getContextPath();

        ProductDAO dao = new ProductDAO();
        int cnt = dao.delProduct(pno);

        response.sendRedirect(home+"/ProList.do");
    }
}
