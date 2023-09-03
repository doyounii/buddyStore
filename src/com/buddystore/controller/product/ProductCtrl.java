package com.buddystore.controller.product;

import com.buddystore.dto.Product;
import com.buddystore.dto.Review;
import com.buddystore.model.ProductDAO;
import com.buddystore.model.ReviewDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Product.do")  //Product.do?pno=${pro.pno}
public class ProductCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "상품 리스트를 출력합니다.");

        int pno = Integer.parseInt(request.getParameter("pno"));

        ProductDAO dao = new ProductDAO();
        Product pro = dao.getProduct(pno);
        int amount = dao.getAmount(pno);

        ReviewDAO dao2 = new ReviewDAO();
        List<Review> revList = dao2.reviewList(pno);

        request.setAttribute("pro", pro);
        request.setAttribute("amount", amount);
        request.setAttribute("revList", revList);
        RequestDispatcher view = request.getRequestDispatcher("/product/getProduct.jsp");
        view.forward(request, response);
    }
}
