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
 * Servlet implementation class InsertIntroductionNotice
 */
@WebServlet("/insertNotice.in")
public class InsertIntroductionNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertIntroductionNoticeServlet() {
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
		String writer = request.getParameter("writer");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
	
		IntroNotice newNotice = new IntroNotice();
		newNotice.setTitle(title);
		newNotice.setCategory(category);
		newNotice.setContent(content);
		
		int result = new NoticeService().insertNotice(newNotice);
		
		String path = "";
		if(result > 0) {
			path = "selectNoticeAdmin.in";
			response.sendRedirect(path);
		} else {
			path = "views/common/errorPage.jsp";
			request.setAttribute("message", "공지사항 등록 실패");
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

}
