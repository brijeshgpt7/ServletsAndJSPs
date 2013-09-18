package com.thefax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.thefax.bean.LoginBean;
import com.thefax.bean.UserBean;
import com.thefax.dao.ShoppingDao;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Getting request header referer
		String referer = request.getHeader("referer");
		ShoppingDao dao = new ShoppingDao();

		if (referer.contains("home.jsp")) {
			// Request is coming for login authentication
			LoginBean login = new LoginBean();
			login.setUserid(request.getParameter("userid"));
			login.setPassword(request.getParameter("password"));

			if (dao.validate(login)) {
				// Redirect user to Catalog page
				HttpSession session = request.getSession();
				session.setAttribute("USER", login.getUserid());
				getServletContext().getRequestDispatcher("/shopping.fax")
						.forward(request, response);
			} else {
				// Send him back to login/home page
				response.sendRedirect("home.jsp?invalid=yes");
			}
		} else {
			// Request is for User registration
			UserBean user = new UserBean();
			user.setUserid(request.getParameter("userid"));
			user.setName(request.getParameter("name"));
			user.setPassword(request.getParameter("password"));
			user.setAge(Integer.parseInt(request.getParameter("age")));
			user.setCity(request.getParameter("city"));
			user.setPhone(request.getParameter("phone"));
			user.setEmail(request.getParameter("email"));

			if (dao.persist(user))
				response.sendRedirect("home.jsp");
			else
				response.sendRedirect("registration.jsp");

		}

	}

}
