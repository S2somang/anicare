package org.anicare.jsp.education.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.common.MyFileRenamePolicy;
import org.anicare.jsp.education.model.service.EventService;
import org.anicare.jsp.education.model.vo.BoardAttachment;
import org.anicare.jsp.education.model.vo.Post;
import org.anicare.jsp.member.model.vo.Member;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InsertEducationEventAdminServlet
 */
@WebServlet("/insertEventAdmin.ed")
public class InsertEducationEventAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertEducationEventAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		
		
		
//		String path = "";
//		path = "views/admin/education/adminInsertEvent.jsp";
//		request.getRequestDispatcher(path).forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		
//		System.out.println(title);
//		System.out.println(content);
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String filePath = root + "resources/images/education";
			
			MultipartRequest multiRequest = 
					new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<>();
			ArrayList<String> originFiles = new ArrayList<>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				System.out.println("name : " + name);
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			
			System.out.println("fileSystem name : " + saveFiles);
			System.out.println("originFile name : " + originFiles);
			
			String multiTitle = multiRequest.getParameter("title");
			String multiContent = multiRequest.getParameter("content");
			
			String bWriter = ((Member) request.getSession().getAttribute("loginUser")).getUserId();
			
			Post post = new Post();
			post.setTitle(multiTitle);
			post.setContent(multiContent);
			post.setUserId(bWriter);
			
			System.out.println(multiTitle);
			System.out.println(multiContent);
			System.out.println(bWriter);
			
			
			ArrayList<BoardAttachment> fileList = new ArrayList<BoardAttachment>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				BoardAttachment ba = new BoardAttachment();
				ba.setFilePath(filePath);
				ba.setOriginName(originFiles.get(i));
				ba.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size() - 1) {
					ba.setOriginName(originFiles.get(i));
				} else {
					ba.setOriginName("thumbNail_" + originFiles.get(i));
				}
				
				fileList.add(ba);
			}
			
			
			Map<String, Object> requestData = new HashMap<String, Object>();
			requestData.put("post", post);
			requestData.put("fileList", fileList);
			
			System.out.println("requestData : " + requestData);
			
			int result = new EventService().insertEvent(requestData);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/selectEventAdmin.ed");
			} else {
				for(int i = 0; i <saveFiles.size(); i++) {
					File faildFile = new File(filePath + saveFiles.get(i));
					
					faildFile.delete();
				}
				
				request.setAttribute("message", "교육행사 게시판 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}
		
		
	}

}
