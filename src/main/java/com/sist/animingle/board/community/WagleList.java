package com.sist.animingle.board.community;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.WagleDAO;
import com.sist.animingle.board.repository.WagleDTO;

@WebServlet("/board/waglelist.do")
public class WagleList extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		test(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		test(req, resp);
		
	}


	private void test(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//WagleList.java
		
		HttpSession session = req.getSession();
		
		session.setAttribute("read", "n"); 

		
		
		String search = "n"; 
		String searchtext = req.getParameter("searchtext");
		String prefix = req.getParameter("prefix");
		
		
		
		 int currentPage = 1; // 현재 페이지 번호 
		 int itemsPerPage = 5; // 페이지당 항목
		 
	    
		 String pageParam = req.getParameter("page"); 
		 if (pageParam != null) {
		 currentPage = Integer.parseInt(pageParam); }
		 
		
		
		
		 if ((searchtext == null) || searchtext.equals("")) { 
			 
			 search = "n"; 
			 
		 } else {
			 
			 search = "y";
		 
		 }
		 
		
		HashMap<String, String> map = new HashMap<String,String>();
		
		WagleDAO dao = new WagleDAO();
		
		
		
		
		 // 모든 게시물의 수를 담는다 
		int totalDataCount = dao.getTotalDataCount();
		 
		 // 현재 페이지 수 계산 
		int totalPage = (int) Math.ceil((double) totalDataCount / itemsPerPage);
		 
		 // 모든 게시글 목록을 리스트에 담는다 
			/* List<WagleDTO> list = dao.getBoardContent(currentPage, itemsPerPage); */
		
		 
		 int maxPage = 5; // 한 번에 표시할 최대 페이지 수
	     int startPage = Math.max(currentPage - (maxPage / 2), 1);
	     int endPage = Math.min(startPage + maxPage - 1, totalPage);
		 

		
		map.put("searchtext", searchtext);
		map.put("search", search); 
		map.put("currentPage", Integer.toString(currentPage));
		map.put("itemsPerPage", Integer.toString(itemsPerPage));
		
		
		
		
		List<WagleDTO> list = dao.list(map);
		
		 /*if (prefix == null) { 
			 List<WagleDTO> slist = dao.list(map);
		 
		 for (WagleDTO dto : slist) {
		 dto.setWg_regdate(dto.getWg_regdate().substring(0, 10)); 
		 }
		 
		 req.setAttribute("list", slist); 
		 
		 
		 } else { 
			 List<WagleDTO> slist =  dao.prefixlist(prefix);
		 
		 for (WagleDTO dto : slist) {
		 dto.setWg_regdate(dto.getWg_regdate().substring(0, 10)); 
		 }
		 
		 req.setAttribute("list", slist); 
		 }
		 */
		
		for (WagleDTO dto : list) {
			 dto.setWg_regdate(dto.getWg_regdate().substring(0, 10)); 
		}
		
		
		
		req.setAttribute("list", list);
	    req.setAttribute("currentPage", currentPage);
	    req.setAttribute("totalPage", totalPage);
	    req.setAttribute("startPage", startPage);
	    req.setAttribute("endPage", endPage);
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/waglelist.jsp");
		dispatcher.forward(req, resp);
	}

}
