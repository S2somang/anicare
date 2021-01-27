package org.anicare.jsp.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.board.model.service.BoardService;

/**
 * Servlet implementation class DeleteFreeBoardServlet
 */
@WebServlet("/deleteFreeBoard.bo")
public class DeleteFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFreeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		int cc = Integer.parseInt(request.getParameter("cc"));
		
		int result = new BoardService().deleteFreeBoard(bCode, cc);
		
		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectFreeBoardList.bo");
		}
		else {
			request.setAttribute("message", "자유게시판 삭제 실패");
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
