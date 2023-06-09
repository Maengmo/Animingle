package com.sist.animingle.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		
		
		//작성, 수정, 삭제 페이지 id 세션 확인
		if(session.getAttribute("id") == null) {
			if(req.getRequestURI().endsWith("add.do")
					||req.getRequestURI().endsWith("edit.do")
					||req.getRequestURI().endsWith("del.do")) {
				
				PrintWriter writer = ((HttpServletResponse)response).getWriter();
				writer.write("<script>alert('failed');location.href='/toy/index.do'</script>");
				writer.close();
				
				return;
			}
		}
		
		//관리자 페이지 isAdmin 세션 확인
		if(session.getAttribute("isAdmin") == null) {
			if(req.getRequestURI().endsWith("admin.do")
					||req.getRequestURI().endsWith("inquirylist.do")
					||req.getRequestURI().endsWith("inquiryview.do")) {
				
				PrintWriter writer = ((HttpServletResponse)response).getWriter();
				writer.write("<script>alert('failed');location.href='/toy/index.do'</script>");
				writer.close();
				
				return;
			}
		}
		
		
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	
	
}
