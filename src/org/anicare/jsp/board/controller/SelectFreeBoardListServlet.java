package org.anicare.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.board.model.service.BoardService;
import org.anicare.jsp.board.model.vo.Board;

/**
 * Servlet implementation class SelectFreeBoardList
 */
@WebServlet("/selectFreeBoardList.bo")
public class SelectFreeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFreeBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cp = 1;
		int limit;
		int mp;
		int sp;
		int ep;
		
		if (request.getParameter("cp") != null) {
			cp = Integer.parseInt(request.getParameter("cp"));
		}
		limit = 10;
		
		BoardService bs = new BoardService();
		int freeBoardListCount = bs.getFreeBoardListCount();
		
		mp = (int) ((double) freeBoardListCount / limit + 0.9);
		sp = (((int)((double) cp / limit + 0.9)) - 1) * limit + 1;
		
		ep = sp + limit - 1;
		ep = mp < ep ? ep = mp : ep;
		
		Map<String, Integer> pageInfo = new HashMap<>();
		pageInfo.put("cp", cp);
		pageInfo.put("freeBoardListCount", freeBoardListCount);
		pageInfo.put("limit", limit);
		pageInfo.put("mp", mp);
		pageInfo.put("sp", sp);
		pageInfo.put("ep", ep);
		
		ArrayList<Board> list = bs.selectFreeBoardListPagenation(pageInfo);
		
		// add Comment Count Concat to Title.. already many page exist
		// map -> inefficient, result -> Add Two ArrayList
		ArrayList<Integer> bcodeList = bs.selectBcodeCountListForPagenation(pageInfo, 10);
		
		ArrayList<Integer> commentCountList = bs.selectCommentCountList(bcodeList, "10");
		
		if (list != null) {
			request.setAttribute("condition", "general");
			request.setAttribute("freeBoardList", list);
			request.setAttribute("freeBoardCommentList", commentCountList);
			request.setAttribute("freeBoardpageInfo", pageInfo);
			request.getRequestDispatcher("views/board/freeBoard.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message", "자유게시판 목록보기 실패");
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
