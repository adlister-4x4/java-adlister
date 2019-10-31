package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.DisplayAdServlet", urlPatterns = "/ad")
public class DisplayAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adId = request.getParameter("ad_id");


        String userId = request.getParameter("user_id");

        if (adId == null){
            response.sendRedirect("/ads");
            return;
        }


//        System.out.println("== user from DisplayAServlet: " + DaoFactory.getUsersDao().findUserByAdId(userId));
//
//        System.out.println("== ad id from DisplayAServlet: " + DaoFactory.getAdsDao().returnAd(adId));

        // Returns ad details user clicked
        request.setAttribute("ads", DaoFactory.getAdsDao().returnAd(adId));

        //Returns user from selected ad
        request.setAttribute("users", DaoFactory.getUsersDao().findUserByAdId(userId));
        request.getRequestDispatcher("/WEB-INF/ads/displayAdPage.jsp").forward(request, response);

    }

}
