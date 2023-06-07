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
		
		req.getSession().setAttribute("id", "pineappe4");
		
		String prefix = req.getParameter("prefix");
		
		String search = "n";
		String searchtext = req.getParameter("searchtext");
		
		
		
		if ((searchtext == null) || searchtext.equals("")) {
			search = "n";
		} else {
			search = "y";
		}
		
		HashMap<String, String> map = new HashMap<String,String>();
		
		WagleDAO dao = new WagleDAO();
		
		List<WagleDTO> searchlist = dao.list(map);
		
		map.put("searchtext", searchtext);
		map.put("search", search);
		
		
		
		
		if (prefix == null) {
			List<WagleDTO> list = dao.list(map);
			
			for (WagleDTO dto : list) {
				dto.setWg_regdate(dto.getWg_regdate().substring(0, 10));
			}
			
			req.setAttribute("list", list);
		} else {
			List<WagleDTO> list = dao.prefixlist(prefix);
			
			for (WagleDTO dto : list) {
				dto.setWg_regdate(dto.getWg_regdate().substring(0, 10));
			}
			
			req.setAttribute("list", list);
		}
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/waglelist.jsp");
		dispatcher.forward(req, resp);
	}

}
