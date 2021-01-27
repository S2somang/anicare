package org.anicare.jsp.introduction.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.introduction.model.service.NoticeService;

/**
 * Servlet implementation class DeleteIntroductionNoticeServlet
 */
@WebServlet("/deleteNoticeAdmin.in")
public class DeleteIntroductionNoticeAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteIntroductionNoticeAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ncode = request.getParameter("ncode");
		
		int result = new NoticeService().deleteNotice(ncode);
		
		String path = "";
		if(result > 0) {
			path = "/t2/selectNoticeAdmin.in";
			response.sendRedirect(path);
		} else {
			path = "views/common/errorPage.jsp";
			request.setAttribute("message", "공지 삭제 실패");
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

}
