package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("errors") != null) {
            HashMap<String, String> errors = (HashMap<String, String>) session.getAttribute("errors");
            for (String key : errors.keySet()) {
                request.setAttribute(key, errors.get(key));
            }
            session.removeAttribute("errors");
        }
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        boolean registerError = false;
        HashMap<String, String> errors = new HashMap<>();

        // passwords dont match
        if (!password.equals(passwordConfirmation)) {
            registerError = true;
            errors.put("passwordmatch", "Passwords do not match");
        }

        // email invalid
        if (!email.contains("@")) {
            registerError = true;
            errors.put("email", "Invalid email address");
        }

        // user exists
        if (DaoFactory.getUsersDao().findByUsername(username) != null) {
            registerError = true;
            errors.put("userexists", "Username already exists, try another.");
        }

        // return in any error occurs
        if (registerError) {
            session.setAttribute("errors", errors);
            response.sendRedirect("/register");
            return;
        }

        // create and save a new user
        User user = new User(username, email, Password.hash(password));
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}