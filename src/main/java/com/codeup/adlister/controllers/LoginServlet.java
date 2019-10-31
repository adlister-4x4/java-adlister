package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import com.mysql.cj.api.Session;
import com.mysql.cj.api.x.XSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);


        boolean loginError = false;
        HashMap<String, String> errors = new HashMap<>();

        if (user == null) {
            loginError = true;
            errors.put("invaliduser", "That username does not exist.");
        }

        if (password.isEmpty()) {
            loginError = true;
            errors.put("pwderror", "Password field cannot be blank.");
        }

        if (loginError) {
            session.setAttribute("errors", errors);
            response.sendRedirect("/login");
            return;
        }

        boolean validAttempt = Password.check(password, user.getPassword());
        if (!validAttempt) {
            response.sendRedirect("/login");
        } else {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        }
    }
}
