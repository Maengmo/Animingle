package com.sist.animingle.board.community;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.board.repository.WTPathDTO;
import com.sist.animingle.board.repository.WalkTogetherDAO;
import com.sist.animingle.board.repository.WalkTogetherDTO;

@WebServlet("/board/walktogetheradd.do")
public class WalkTogetherAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/walktogetheradd.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		//산책 친구 게시글 DB 저장
		String id = (String)session.getAttribute("id");
		String subject = req.getParameter("subject");
		String petKind = req.getParameter("petKind");
		String walkTime = req.getParameter("walkTime");
		String text = req.getParameter("text");
		String seq = req.getParameter("seq");
		
		WalkTogetherDTO dto1 = new WalkTogetherDTO();
		dto1.setId(id);
		dto1.setWt_subject(subject);
		dto1.setWt_petkind(petKind);
		dto1.setWt_time(walkTime);
		dto1.setWt_content(text);
		dto1.setWt_seq(seq);
		
		
		WalkTogetherDAO dao = new WalkTogetherDAO();
		//dao.addContent(dto1);
		//TODO DB에 이미 있을 경우 update 하기
		
		//산책 친구 경로 DB 저장
		String[] pathLat = req.getParameterValues("pathLat");
		String[] pathLng = req.getParameterValues("pathLng");
		String wt_seq = String.valueOf(dao.getWtSeq());
		
		
		List<WTPathDTO> pathList = new ArrayList<WTPathDTO>();
		
		int cnt = 1;
		
		if(pathLat != null && pathLng != null) {
			for (int i=0; i<pathLat.length; i++) {
	
				WTPathDTO dto2 = new WTPathDTO();
				
				dto2.setWt_seq(wt_seq);
				dto2.setWtp_lat(pathLat[i]);
				dto2.setWtp_lng(pathLng[i]);
				dto2.setWtp_order(cnt++);
				
				pathList.add(dto2);
				
			}
		}
		
		//dao.addPath(pathList);
		//TODO DB에 이미 있을 경우 update 하기
		
		resp.sendRedirect("/animingle/board/walktogetherlist.do");
		
	}

}
