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
 * Servlet implementation class UpdateReplyAdoptionBoardServlet
 */
@WebServlet("/updateReplyAdoptionBoard.bo")
public class UpdateReplyAdoptionBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReplyAdoptionBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		String content = request.getParameter("content");
		int refBcode = Integer.parseInt(request.getParameter("refBcode"));
		int cc = Integer.parseInt(request.getParameter("cc"));
		
		Board b = new Board();
		b.setbCode(bCode);
		b.setContent(content);
		b.setRefBcode(refBcode);
		b.setCc(cc);
		
		Board changeReply = new BoardService().updateReplyAdoptionBoard(b);
		String path = request.getContextPath();
		if (changeReply != null) {
			path += "/selectOneAdoptionBoard.bo?bCode=" + refBcode;
			path += "&cc=" + cc;
			response.sendRedirect(path);
		}
		else {
			request.setAttribute("message", "입양후기 게시판 댓글 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
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
