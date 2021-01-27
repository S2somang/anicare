package org.anicare.jsp.support.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anicare.jsp.common.MyFileRenamePolicy;
import org.anicare.jsp.support.model.service.SupportService;
import org.anicare.jsp.support.model.vo.SuAttachment;
import org.anicare.jsp.support.model.vo.SuBoard;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SupportReInsertOneServlet
 */
@WebServlet("/updateList.sp")
public class SupportUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
				
		
		
			//게시글 번호 가져와... 머야 어케가져온거야...? 뭐야...num이라는 이름을 내가 햇어?
				
			
				if(ServletFileUpload.isMultipartContent(request)) {
					int maxSize = 1024 * 1024 * 30;  
					
					String root = request.getSession().getServletContext().getRealPath("/");
					
					System.out.println(root);///Users/baegayeong/git/team2-semi-project/web/
					
					// 폴더위치 여부 팀원에게 공개 필요
					String filePath = root + "resources/uploadFiles/supportOneUploadFiles/"; 
					
					//삭제할 파일 폴더 
					String fileDelete = root + "resources/uploadFiles/supportOneUploadFiles/";
					
					
					
					
					 MultipartRequest multiRequest = 
							new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
						
					int num = Integer.parseInt(multiRequest.getParameter("num"));
					
					String meet = multiRequest.getParameter("meet");
					String friend = multiRequest.getParameter("friend");
					String support = multiRequest.getParameter("support");
					String sad = multiRequest.getParameter("sad");
					String content =meet + "-$"+ friend +"-$"+ support +"-$"+ sad ;
					
					System.out.println("num!!! : " + num);
					System.out.println("수정한 content " + content);
					
					String[] tcode = multiRequest.getParameterValues("tcode");
					
					for(int i = 0; i<tcode.length; i++) {
						System.out.println("tcode : "+tcode[i]);
					}
					
					//ArrayList<String> tcodes = new ArrayList<>();
					ArrayList<String> saveFiles = new ArrayList<>();
					
					ArrayList<String> originFiles = new ArrayList<>();
					
					Enumeration<String> files = multiRequest.getFileNames();
					String files2 = multiRequest.getFilesystemName("saveFiles");
					
					
					
					
					
					while(files.hasMoreElements()) {
						String name = files.nextElement();
						System.out.println(name );
						
						//if(files2 !=null) {
							//System.out.println("null아닌것");
						
						
						 
						saveFiles.add(multiRequest.getFilesystemName(name));
						
						originFiles.add(multiRequest.getOriginalFileName(name));
						//}
						
					}
					
						
					
					System.out.println("savefile name : " + saveFiles);
					System.out.println("originfile name : " + originFiles);
				
				
//					for(int i = 0; i< saveFiles.size(); i++) {
//						if(saveFiles.get(i) == null) {
//							System.out.println("null....");
//							
//						}else {
//							System.out.println("값 들어왕");
//						}
//					}
				
				
				
				ArrayList<SuAttachment> fileList = new ArrayList<>();
				
				for(int i = originFiles.size() -1; i>=0; i--) {
					SuAttachment sa = new SuAttachment();
					System.out.println("i : "+i);
					int tco = tcode.length-(i+1);
					System.out.println("tco =" +tco );
				
					sa.setFilePath(filePath);
					sa.settCode(Integer.parseInt(tcode[tco]));
					sa.setOriginName(originFiles.get(i));
					sa.setChangeName(saveFiles.get(i));
					//sa.setDcode(dcode);
					
					if(i == originFiles.size() -1 ) {
						sa.setFileLevel(0);
					}else {
						sa.setFileLevel(1);
					}
					
					fileList.add(sa);
					
				}
				
				
				
				
				SuBoard su = new SuBoard();
				su.setStCode(num);
				su.setContent(content);
				
				Map<String, Object> updateInfo = new HashMap<>();
				
				updateInfo.put("su",su );
				updateInfo.put("fileList",fileList );
				
				System.out.println("updateInfo Map 소망  : " + updateInfo);
				
				int result = new SupportService().updateInfo(updateInfo);
				
				System.out.println("updateInfo 결과 결과 결과    :" + result);
				
				String path ="";
				if(result > 0 ) {
					response.sendRedirect(request.getContextPath()+"/oneSelectList.sp");
					
					
				}else {
//					for(int i =0; i<saveFiles.size(); i++) {
//						File faildFile = new File(filePath + saveFiles.get(i));
//						
//						faildFile.delete();
//					}
					request.setAttribute("message", "사진업ㅇ데이트 실패라능 ");
					path ="views/common/errorPage.jsp";
					request.getRequestDispatcher(path).forward(request, response);
				}
				
		
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