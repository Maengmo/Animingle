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

import com.sist.animingle.board.repository.WagleCommentDTO;
import com.sist.animingle.board.repository.WagleDAO;
import com.sist.animingle.board.repository.WagleDTO;

@WebServlet("/board/wagleview.do")
public class WagleView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//WagleView.java
		HttpSession session = req.getSession();


		
		String seq = req.getParameter("seq");
		
		WagleDAO dao = new WagleDAO();
		
		WagleDTO dto = dao.getWagleCont(seq);
		
		dto.setWg_regdate(dto.getWg_regdate().substring(0, 10));
		
	
		List<WagleCommentDTO> clist = dao.WagleClist(seq);
		HashMap<String, String> map = new HashMap<String,String>();
		
		for (WagleCommentDTO cdto : clist) {
			cdto.setWgc_regdate(cdto.getWgc_regdate().substring(0, 10));
		}
		
		String ccnt = dao.getWagleCcnt(seq);
		
		
		if (session.getAttribute("read") == null
				|| session.getAttribute("read").toString().equals("n")) {
			//읽음 증가
			dao.readcountupdate(seq);
			session.setAttribute("read", "y");
		}
		
		
		map.put("ccnt", ccnt);
		
		req.setAttribute("dto", dto);
		req.setAttribute("clist", clist);
		req.setAttribute("map", map);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/wagleview.jsp");
		dispatcher.forward(req, resp);
	}

}

