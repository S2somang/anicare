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
 * Servlet implementation class UpdateMissingBoardServlet
 */
@WebServlet("/updateMissingBoard.bo")
public class UpdateMissingBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMissingBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		int cc = Integer.parseInt(request.getParameter("cc"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String mDate = request.getParameter("mDate");
		String mTime = request.getParameter("mTime");
		String info = request.getParameter("info");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		String map = lat + "%" + lng;
		
//		System.out.println("bCode : " + bCode);
//		System.out.println("title : " + title);
//		System.out.println("content : " + content);
//		System.out.println("mDate : " + mDate);
//		System.out.println("mTime : " + mTime);
//		System.out.println("info : " + info);
//		System.out.println("lat : " + lat);
//		System.out.println("lng : " + lng);
//		System.out.println("map : " + map);
		
		Board b = new Board();
		b.setbCode(bCode);
		b.setCc(cc);
		b.setTitle(title);
		b.setContent(content);
		
		Missing m = new Missing();
		m.setmDate(Date.valueOf(mDate));
		m.setbCode(bCode);
		m.setmTime(mTime);
		m.setInfo(info);
		m.setMap(map);
		
		Map<String, Object> updateInfo = new HashMap<>();
		updateInfo.put("BOARD", b);
		updateInfo.put("MISSING", m);
		
		int result = new BoardService().updateMissingBoard(updateInfo);
		
		String path = request.getContextPath();
		if (result > 0) {
			path += "/selectOneMissingBoard.bo?bCode=" + bCode;
			path += "&cc=" + cc;
			response.sendRedirect(path);
		}
		else {
			request.setAttribute("message", "실종게시판 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
