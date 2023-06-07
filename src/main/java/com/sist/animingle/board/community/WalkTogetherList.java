package com.sist.animingle.board.community;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.animingle.board.repository.WalkTogetherDAO;
import com.sist.animingle.board.repository.WalkTogetherDTO;

@WebServlet("/board/walktogetherlist.do")
public class WalkTogetherList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/community/walktogetherlist.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//지도 영역 안 데이터 불러오기
        String swLat = req.getParameter("swLat");
        String swLng = req.getParameter("swLng");
        String neLat = req.getParameter("neLat");
        String neLng = req.getParameter("neLng");
        
        WalkTogetherDAO dao = new WalkTogetherDAO();
        
        List<WalkTogetherDTO> ilist = dao.getWriting();
        List<List<String>> plist = dao.getPath(swLat, swLng, neLat, neLng);
        
        Collections.sort(plist, new Comparator<List<String>>() {
            @Override
            public int compare(List<String> o1, List<String> o2) {
                int result = o1.get(0).compareTo(o2.get(0));
                if (result != 0) {
                    return result;
                } else {
                    return o1.get(1).compareTo(o2.get(1));
                }
            }
        });
        
        HttpSession session = req.getSession();
		String sessionId = (String)session.getAttribute("id");
        
        JSONArray arr = new JSONArray();

        for (int i = 0; i < ilist.size(); i++) {
        	
            JSONObject obj = new JSONObject();
            
            obj.put("wt_seq", ilist.get(i).getWt_seq());
            obj.put("wt_subject", ilist.get(i).getWt_subject());
            obj.put("wt_writer", ilist.get(i).getWt_writer());
            obj.put("session_id", sessionId);
            obj.put("wt_petkind", ilist.get(i).getWt_petkind());
            obj.put("wt_time", ilist.get(i).getWt_time());
            obj.put("wt_content", ilist.get(i).getWt_content());
            obj.put("plist", plist);
            arr.add(obj);
            
        }
        
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter writer = resp.getWriter();
        writer.print(arr.toString());
        writer.close();

    }

}
