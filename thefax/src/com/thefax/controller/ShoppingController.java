package com.thefax.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.thefax.bean.ProductBean;
import com.thefax.dao.ShoppingDao;

public class ShoppingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ShoppingDao dao = new ShoppingDao();
		
		String code = request.getParameter("code");
		if (code != null) {
			// Request is coming to add item to cart
			ProductBean product = dao.getProduct(code);
			// Creating an ArrayList object to represent Cart for USER
			ArrayList<ProductBean> cart = null;
			
			// Getting session object, getSession() method checks for existing session
			// if no session id found in request header a new session object is returned
			HttpSession session = request.getSession();
			// Getting cart object from session
			cart = (ArrayList<ProductBean>) session.getAttribute("CART");
			//if cart object remains null, that means its a new session, so...
			if(cart == null)
				cart = new ArrayList<ProductBean>();
			
			//Adding product to cart ArrayList
			cart.add(product);
			//Adding or updating cart attribute in session
			session.setAttribute("CART", cart);
			
			// Adding product object in request scope
			request.setAttribute("PRODUCT", product);
			// Forwarding control to summary page
			getServletContext().getRequestDispatcher("/summary.jsp").forward(request,response);
			
		} else {
			ArrayList<ProductBean> catalog = dao.getCatalog();

			// Adding catalog to Request Scope
			request.setAttribute("CATALOG", catalog);

			// Forward request to catalog page
			ServletContext srvCtx = getServletContext();
			// Getting Dispatcher from context for catalog page
			RequestDispatcher reqDsp = srvCtx
					.getRequestDispatcher("/catalog.jsp");
			// Forwarding request for invoking service method by passing req &
			// resp
			reqDsp.forward(request, response);
		}
	}
}
