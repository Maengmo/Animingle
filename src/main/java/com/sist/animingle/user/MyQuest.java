package com.sist.animingle.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.animingle.user.repository.MyQuestDTO;
import com.sist.animingle.user.repository.UserDAO;

@WebServlet("/user/myquest.do")
public class MyQuest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//MyQuest.java
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		if (id == null || id.equals("")) {
			
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('회원 전용 메뉴입니다.');history.back();</script>");
			writer.close();
			return;
			
		}
		
		UserDAO dao = new UserDAO();
		
		List<MyQuestDTO> mqlist = dao.getMQlist(id);
		
		for (MyQuestDTO mqdto : mqlist) {
			
			if (mqdto.getIn_state().equals("확인중")) {
				continue;
			} else {
				
				String subject = mqdto.getIn_subject();
				String content = mqdto.getIna_content();
				
				subject = subject.replace("<", "&lt;").replace(">","&gt;").replace("\\n", "<br>");
				content = content.replace("<", "&lt;").replace(">","&gt;").replace("\\n", "<br>");
				
				mqdto.setIn_subject(subject);
				mqdto.setIna_content(content);
				
			}
			
		}
		
		req.setAttribute("mqlist", mqlist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/myquest.jsp");
		dispatcher.forward(req, resp);
	}

}
