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
 * Servlet implementation class SelectOneFreeBoard
 */
@WebServlet("/selectOneFreeBoard.bo")
public class SelectOneFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneFreeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		int commentCount = Integer.parseInt(request.getParameter("cc"));
		System.out.println("bCode : " + bCode);
		System.out.println("commentCount : " + commentCount);
		BoardService bs = new BoardService();
		
		Board selectFreeBoardPost = bs.selectOneFreeBoard(bCode);
		
		ArrayList<Board> replyList = bs.selectReplyList(bCode, "10");
		
		System.out.println("replyList : " + replyList);
		Map<String, Object> replyInfo = new HashMap<>();
		
		replyInfo.put("replyListFreeBoard", replyList);
		replyInfo.put("commentCountFreeBoard", commentCount);
		
		if (selectFreeBoardPost != null) {
			request.setAttribute("selectFreeBoardPost", selectFreeBoardPost);
			request.setAttribute("replyInfoFreeBoard", replyInfo);
			request.getRequestDispatcher("views/board/freeBoardDetailView.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message", "자유게시판 상세조회 실패");
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
