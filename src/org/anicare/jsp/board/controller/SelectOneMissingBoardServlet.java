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
 * Servlet implementation class SelectOneMissingBoardServlet
 */
@WebServlet("/selectOneMissingBoard.bo")
public class SelectOneMissingBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneMissingBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		int commentCount = Integer.parseInt(request.getParameter("cc"));
		System.out.println("bcode : " + bCode);
		System.out.println("commentCount : " + commentCount);
		
		BoardService bs = new BoardService();
		
		Map<String, Object> selectMissingBoardPost = bs.selectOneMissingBoard(bCode);
		
		System.out.println("selectMissingBoardPost : " + selectMissingBoardPost);
		ArrayList<Board> replyList = bs.selectReplyList(bCode, "20");
		System.out.println("replyList : " + replyList);
		
		Map<String, Object> replyInfo = new HashMap<>();
		
		replyInfo.put("replyListMissingBoard", replyList);
		replyInfo.put("commentCountMissingBoard", commentCount);
		
		if (selectMissingBoardPost != null) {
			request.setAttribute("selectMissingBoardPost", selectMissingBoardPost);
			request.setAttribute("replyInfoMissingBoard", replyInfo);
			request.getRequestDispatcher("views/board/missingBoardDetailView.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message", "실종게시판 상세조회 실패");
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
