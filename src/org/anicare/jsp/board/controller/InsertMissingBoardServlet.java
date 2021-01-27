package org.anicare.jsp.board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.board.model.service.BoardService;
import org.anicare.jsp.board.model.vo.Board;
import org.anicare.jsp.board.model.vo.Missing;

/**
 * Servlet implementation class InsertMissingBoardServlet
 */
@WebServlet("/insertMissingBoard.bo")
public class InsertMissingBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMissingBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String userId = request.getParameter("userId");
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		
		String mDate = request.getParameter("mDate");
		String mTime = request.getParameter("mTime");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		String map = lat + "%" + lng;
		String info = request.getParameter("info");
		
		// need data manufacturing location, datetime
//		System.out.println("title : " + title);
//		System.out.println("userId : " + userId);
//		System.out.println("content : " + content);
//		System.out.println("mDate : " + mDate);
//		System.out.println("mTime : " + mTime);
//		System.out.println("lat : " + lat);
//		System.out.println("lng : " + lng);
//		System.out.println("map : " + map);
		
		Board b = new Board();
		b.setTitle(title);
		b.setUserId(userId);
		b.setContent(content);
		b.setName(name);
		
		Missing m = new Missing();
		m.setmDate(Date.valueOf(mDate));
		m.setmTime(mTime);
		m.setMap(map);
		m.setInfo(info);
		
		Map<String, Object> insertInfo = new HashMap<>();
		insertInfo.put("BOARD", b);
		insertInfo.put("MISSING", m);
		
		int result = new BoardService().insertMissingBoard(insertInfo);
		
		// add view process
		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectMissingBoardList.bo");
		}
		else {
			request.setAttribute("message", "실종게시판 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
