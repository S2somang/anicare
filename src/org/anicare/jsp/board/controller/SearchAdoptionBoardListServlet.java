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
 * Servlet implementation class SearchAdoptionBoardListServlet
 */
@WebServlet("/searchAdoptionBoardList.bo")
public class SearchAdoptionBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAdoptionBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cp = 1;
		int limit = 10;
		int mp;
		int sp;
		int ep;
		
		if (request.getParameter("cp") != null) {
			cp = Integer.parseInt(request.getParameter("cp"));
		}
		String searchText = request.getParameter("searchText");
		
		BoardService bs = new BoardService();
		
		int searchAdoptionBoardListCount = bs.getSearchAdoptionBoardListCount(searchText);
		
		mp = (int) ((double) searchAdoptionBoardListCount / limit + 0.9);
		sp = (((int)((double) cp / limit + 0.9)) - 1) * limit + 1;
		
		ep = sp + limit - 1;
		ep = mp < ep ? mp : ep;
		
		Map<String, Integer> pageInfo = new HashMap<>();
		pageInfo.put("cp", cp);
		pageInfo.put("adoptionBoardListCount", searchAdoptionBoardListCount);
		pageInfo.put("limit", limit);
		pageInfo.put("mp", mp);
		pageInfo.put("sp", sp);
		pageInfo.put("ep", ep);
		
		ArrayList<Board> list = bs.searchAdoptionBoardListPagenation(pageInfo, searchText);
		
		System.out.println("controller : " + list);
		ArrayList<Integer> bcodeList = bs.selectBcodeListForSearch(pageInfo, searchText, "40");
		ArrayList<Integer> commentCountList = bs.selectCommentCountList(bcodeList, "40");
		if (list != null) {
			request.setAttribute("condition", "search");
			request.setAttribute("searchText", searchText);
			request.setAttribute("adoptionBoardList", list);
			request.setAttribute("adoptionBoardCommentList", commentCountList);
			request.setAttribute("adoptionBoardpageInfo", pageInfo);
			request.getRequestDispatcher("views/board/adoptionBoard.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message", "입양 후기 게시판 검색 실패");
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
