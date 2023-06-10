package com.sist.animingle.board.community;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.CommunityListDAO;
import com.sist.animingle.board.repository.VetQnAListDTO;
import com.sist.animingle.board.repository.WagleDAO;
import com.sist.animingle.board.repository.WagleDTO;

@WebServlet("/board/communitylist.do")
public class CommunityList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//CommunityList.java
		

		HttpSession session = req.getSession();
		
		WagleDAO wagledao = new WagleDAO();
		CommunityListDAO listdao = new CommunityListDAO();
		
		List<WagleDTO> waglelist = wagledao.comwaglelist();
		
		List<VetQnAListDTO> qnalist = listdao.comqnalist(); 
		
		for (WagleDTO dto : waglelist) {
			dto.setWg_regdate(dto.getWg_regdate().substring(0, 10));
			
			if (dto.getWg_subject().length() > 18) {
				
				dto.setWg_subject(dto.getWg_subject().substring(0, 18) + "...");
			}
		}
		
		req.setAttribute("waglelist", waglelist);
		req.setAttribute("qnalist", qnalist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/communitylist.jsp");
		dispatcher.forward(req, resp);

	}

}
