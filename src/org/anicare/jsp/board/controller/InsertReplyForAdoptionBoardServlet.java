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
 * Servlet implementation class InsertReplyForAdoptionBoard
 */
@WebServlet("/insertReplyForAdoptionBoard.bo")
public class InsertReplyForAdoptionBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyForAdoptionBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String content = request.getParameter("content");
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		int cc = Integer.parseInt(request.getParameter("cc"));
		
		Board reply = new Board();
		reply.setbCode(bCode);
		reply.setContent(content);
		reply.setUserId(userId);
		
		int result = new BoardService().insertReplyForAdoptionBoard(reply);
		
		String path = request.getContextPath();
		if (result > 0) {
			path += "/selectOneAdoptionBoard.bo?";
			path += "bCode=" + bCode;
			path += "&cc=" + cc;
			response.sendRedirect(path);
		}
		else {
			path = "views/common/errorPage.jsp";
			request.setAttribute("message", "Reply Write fail");
			request.getRequestDispatcher(path).forward(request, response);
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
