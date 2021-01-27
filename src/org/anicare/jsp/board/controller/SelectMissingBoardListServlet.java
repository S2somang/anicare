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

/**
 * Servlet implementation class SelectMissingBoardList
 */
@WebServlet("/selectMissingBoardList.bo")
public class SelectMissingBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMissingBoardListServlet() {
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
		int missingBoardListCount = bs.getMissingBoardListCount();
		
		System.out.println("missingBoardListCount : " + missingBoardListCount);
		mp = (int) ((double) missingBoardListCount / limit + 0.9);
		sp = (((int)((double) cp / limit + 0.9)) - 1) * limit + 1;
		
		ep = sp + limit - 1;
		ep = mp < ep ? ep = mp : ep;
		
		Map<String, Integer> pageInfo = new HashMap<>();
		pageInfo.put("cp", cp);
		pageInfo.put("missingBoardListCount", missingBoardListCount);
		pageInfo.put("limit", limit);
		pageInfo.put("mp", mp);
		pageInfo.put("sp", sp);
		pageInfo.put("ep", ep);
		
		Map<String, Object> list = bs.selectMissingBoardListPagenation(pageInfo);
		ArrayList<Integer> bcodeList = bs.selectBcodeCountListForPagenation(pageInfo, 20);
		ArrayList<Integer> commentCountList = bs.selectCommentCountList(bcodeList, "20");
		if (list != null) {
			request.setAttribute("condition", "general");
			request.setAttribute("missingBoardList", list);
			request.setAttribute("missingBoardCommentList", commentCountList);
			request.setAttribute("missingBoardpageInfo", pageInfo);
			request.getRequestDispatcher("views/board/missingBoard.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message", "실종게시판 목록보기 실패");
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
