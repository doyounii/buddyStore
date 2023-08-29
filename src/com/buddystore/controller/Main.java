package com.buddystore.controller;

import com.buddystore.dto.Product;
import com.buddystore.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Main extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = "천재 김기태";

        ServletContext application = request.getServletContext();
        String realPath = request.getSession().getServletContext().getRealPath("/");

        application.setAttribute("realPath", realPath);  //${realPath }

        ProductDAO dao = new ProductDAO();
        Product bestPro = dao.getBestProduct();
        request.setAttribute("bestPro",bestPro);

        Product newPro = dao.getNewProduct();
        request.setAttribute("newPro",newPro);

        request.setAttribute("user", user);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
        view.forward(request, response);
    }
}
