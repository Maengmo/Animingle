package com.sist.animingle.board.find;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.animingle.board.find.repository.FindCDTO;
import com.sist.animingle.board.find.repository.FindDAO;

@WebServlet("/board/findcommentadd.do")
public class FindCommentAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		String writer = req.getParameter("writer");
		String content = req.getParameter("content");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
			
		FindCDTO cdto = new FindCDTO();
		cdto.setWriter(writer);
		cdto.setContent(content);
		cdto.setFf_seq(seq);
		cdto.setClat(lat);
		cdto.setClng(lng);
		
		FindDAO dao = new FindDAO();
		
		int result = dao.findCommentAdd(cdto);
		result *= dao.findCPositionAdd(cdto);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter WriteAlter = resp.getWriter();
		
		if (result == 1) {
			FindCDTO lastCdto = new FindCDTO();
			
			lastCdto = dao.getLastComment(seq);
			
			JSONObject obj = new JSONObject();
			
			obj.put("nickname", lastCdto.getNickname());
			obj.put("writer", lastCdto.getWriter());
			obj.put("regdate", lastCdto.getRegdate());
			obj.put("content", lastCdto.getContent());
			obj.put("ffc_cnt", lastCdto.getFfc_cnt());
			
			
			WriteAlter.print(obj);
			
			WriteAlter.close();
			
		} else {
			WriteAlter.print("<script>alert('failed');history.back();</script>");
			WriteAlter.close();
		}
		
	}
}