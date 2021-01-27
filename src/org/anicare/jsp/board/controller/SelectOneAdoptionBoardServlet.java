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
 * Servlet implementation class SelectOneAdoptionBoardServlet
 */
@WebServlet("/selectOneAdoptionBoard.bo")
public class SelectOneAdoptionBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneAdoptionBoardServlet() {
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
		
		Board selectAdoptionBoardPost = bs.selectOneAdoptionBoard(bCode);
		
		ArrayList<Board> replyList = bs.selectReplyList(bCode, "40");
		
		System.out.println("replyList : " + replyList);
		Map<String, Object> replyInfo = new HashMap<>();
		
		replyInfo.put("replyListAdoptionBoard", replyList);
		replyInfo.put("commentCountAdoptionBoard", commentCount);
		
		if (selectAdoptionBoardPost != null) {
			request.setAttribute("selectAdoptionBoardPost", selectAdoptionBoardPost);
			request.setAttribute("replyInfoAdoptionBoard", replyInfo);
			request.getRequestDispatcher("views/board/adoptionBoardDetailView.jsp").forward(request, response);
		}
		else {
			request.setAttribute("message", "입양게시판 상세조회 실패");
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
