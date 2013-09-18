package com.thefax.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class ShoppingFilter implements Filter {



	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		//place your code here - execute during request
		System.out.println("Client IP: " + request.getRemoteAddr());
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		// place your code here - execute during response
		PrintWriter out = response.getWriter();
		out.println("<hr><center>&copy; Copyright The Fax.com</center>");
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
