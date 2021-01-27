package org.anicare.jsp.introduction.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.introduction.model.service.NoticeService;
import org.anicare.jsp.introduction.model.vo.IntroNotice;

/**
 * Servlet implementation class UpdateIntroductionNoticeAdminServlet
 */
@WebServlet("/updateNoticeAdmin.in")
public class UpdateIntroductionNoticeAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateIntroductionNoticeAdminServlet() {
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
		String title = request.getParameter("title");
		String ncode = request.getParameter("ncode");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		
		IntroNotice changedNotice = new IntroNotice();
		changedNotice.setTitle(title);
		changedNotice.setNcode(ncode);
		changedNotice.setCategory(category);
		changedNotice.setContent(content);
		
		int result = new NoticeService().updateNotice(changedNotice);
		
		String page = "";
		if( result > 0) {
			response.sendRedirect("/t2/selectNoticeAdmin.in");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("message", "공지 수정 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

}
