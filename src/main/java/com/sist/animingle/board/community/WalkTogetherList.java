package com.sist.animingle.board.community;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.animingle.board.repository.WTPathDTO;
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

        String swLat = req.getParameter("swLat");
        String swLng = req.getParameter("swLng");
        String neLat = req.getParameter("neLat");
        String neLng = req.getParameter("neLng");
        
        WalkTogetherDAO dao = new WalkTogetherDAO();
        
        List<WTPathDTO> mlist = dao.getBeginPath();
        List<WalkTogetherDTO> ilist = dao.getWriting();
        
        JSONArray arr = new JSONArray();

        for (int i = 0; i < mlist.size(); i++) {
        	
            JSONObject obj = new JSONObject();
            
            obj.put("wt_seq", mlist.get(i).getWt_seq());
            obj.put("wtp_lat", mlist.get(i).getWtp_lat());
            obj.put("wtp_lng", mlist.get(i).getWtp_lng());
            obj.put("wtp_order", mlist.get(i).getWtp_order());
            obj.put("wt_seq", ilist.get(i).getWt_seq());
            obj.put("wt_writer", ilist.get(i).getWt_writer());
            obj.put("wt_petkind", ilist.get(i).getWt_petkind());
            obj.put("wt_time", ilist.get(i).getWt_time());
            obj.put("wt_content", ilist.get(i).getWt_content());
            arr.add(obj);
            
        }
        
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        PrintWriter writer = resp.getWriter();
        writer.print(arr.toString());
        writer.close();

    }

}
