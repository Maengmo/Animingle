package com.sist.animingle.board.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.animingle.board.repository.WalkTogetherDAO;

@WebServlet("/board/walktogetheredit.do")
public class WalkTogetherEdit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String subject = req.getParameter("subject");
		String petKind = req.getParameter("petkind");
		String time = req.getParameter("time");
		
		String[] tmpPath = req.getParameterValues("pathlist");
		String[] path = tmpPath[0].split(",");
				
		JSONArray arr = new JSONArray();
		
		for(int i=0; i<path.length; i+= 4) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("seq", path[i]);
			obj.put("order", path[i + 1]);
			obj.put("lat", path[i + 2]);
			obj.put("lng", path[i + 3]);
			
			arr.add(obj);
		}
		
		WalkTogetherDAO dao = new WalkTogetherDAO();
		String content = dao.getContent(seq);
		
		req.setAttribute("seq", seq);
		req.setAttribute("content", content);
		req.setAttribute("subject", subject);
		req.setAttribute("petKind", petKind);
		req.setAttribute("time", time);
		req.setAttribute("path", arr);


        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/walktogetheradd.jsp");
        dispatcher.forward(req, resp);
	}

}
