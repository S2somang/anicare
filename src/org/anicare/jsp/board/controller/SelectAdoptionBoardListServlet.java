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
 * Servlet implementation class SelectAdoptionBoardList
 */
@WebServlet("/selectAdoptionBoardList.bo")
public class SelectAdoptionBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdoptionBoardListServlet() {
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
		
		if(request.getParameter("cp") != null) {
			cp = Integer.parseInt(request.getParameter("cp"));
		}
		limit = 10;
		int adoptionBoardListCount = new BoardService().getAdoptionBoardListCount();
		mp = (int) ((double) adoptionBoardListCount / limit + 0.9);
		sp = (((int)((double) cp / limit + 0.9)) - 1) * limit + 1;
		
		ep = sp + limit - 1;
		ep = mp < ep ? ep = mp : ep;
		
		Map<String, Integer> pageInfo = new HashMap<>();
		pageInfo.put("cp", cp);
		pageInfo.put("adoptionBoardListCount", adoptionBoardListCount);
		pageInfo.put("limit", limit);
		pageInfo.put("mp", mp);
		pageInfo.put("sp", sp);
		pageInfo.put("ep", ep);
		
		BoardService bs = new BoardService();
		ArrayList<Board> list = bs.selectAdoptionBoardListPagenation(pageInfo);
		ArrayList<Integer> bcodeList = bs.selectBcodeCountListForPagenation(pageInfo, 40);
		
		ArrayList<Integer> commentCountList = bs.selectCommentCountList(bcodeList, "40");
		
		if (list != null) {
			request.setAttribute("condition", "general");
			request.setAttribute("adoptionBoardList", list);
			request.setAttribute("adoptionBoardCommentList", commentCountList);
			request.setAttribute("adoptionBoardpageInfo", pageInfo);
			request.getRequestDispatcher("views/board/adoptionBoard.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message", "입양 후기 게시판 불러오기 실패");
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
