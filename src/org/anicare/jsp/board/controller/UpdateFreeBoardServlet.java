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
 * Servlet implementation class UpdateFreeBoardServlet
 */
@WebServlet("/updateFreeBoard.bo")
public class UpdateFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFreeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int cc = Integer.parseInt(request.getParameter("cc"));
		
		Board b = new Board();
		b.setbCode(bCode);
		b.setTitle(title);
		b.setContent(content);
		b.setCc(cc);
		
		Board result = new BoardService().updateFreeBoard(b);
		String path = request.getContextPath();
		if (result != null) {
			path += "/selectOneFreeBoard.bo?bCode=" + bCode;
			path += "&cc=" + cc;
			response.sendRedirect(path);
		}
		else {
			request.setAttribute("message", "자유게시판 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
