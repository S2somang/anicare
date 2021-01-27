package org.anicare.jsp.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.board.model.service.BoardService;
import org.anicare.jsp.board.model.vo.Board;

/**
 * Servlet implementation class InsertFreeBoardServlet
 */
@WebServlet("/insertFreeBoard.bo")
public class InsertFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFreeBoardServlet() {
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
		
		Board insertBoard = new Board();
		insertBoard.setTitle(title);
		insertBoard.setUserId(userId);
		insertBoard.setContent(content);
		insertBoard.setName(name);
		
		int result = new BoardService().insertFreeBoard(insertBoard);
		
		System.out.println("insertFreeBoard result : " + result);
		
		// List Load Through Servlet (pagenation)
		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectFreeBoardList.bo");
		}
		else {
			request.setAttribute("message", "자유게시판 작성 실패");
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
