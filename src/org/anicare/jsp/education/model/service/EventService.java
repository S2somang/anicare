package org.anicare.jsp.education.model.service;

import static org.anicare.jsp.common.JDBCTemplate.close;
import static org.anicare.jsp.common.JDBCTemplate.commit;
import static org.anicare.jsp.common.JDBCTemplate.getConnection;
import static org.anicare.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.anicare.jsp.education.model.Dao.EventDao;
import org.anicare.jsp.education.model.vo.BoardAttachment;
import org.anicare.jsp.education.model.vo.Post;
import org.anicare.jsp.introduction.model.vo.PageInfo;

public class EventService {

	public int getSearchListCount(String searchTitle, String searchContent) {
		Connection con = getConnection();
		int listCount = new EventDao().listCount(con, searchTitle, searchContent);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectEvent(String searchTitle, String searchContent, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new EventDao().selectEvent(con, searchTitle, searchContent, pi);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectDetailEvent(int num) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = null;
		EventDao ed = new EventDao();
		
		int result = ed.updateCount(con, num);
		
		if(result > 0) {
			
			hmap = ed.selectDetailEvent(con, num);
			
			if(hmap != null) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		
		close(con);
		
		return hmap;
	}

	public int insertEvent(Map<String, Object> requestData) {
		Connection con = getConnection();
		int result = 0;
		
		EventDao ed = new EventDao();
		Post post = (Post) requestData.get("post");
		ArrayList<BoardAttachment> fileList = (ArrayList<BoardAttachment>) requestData.get("fileList");
		
		int result1 = ed.insertEventContent(con, post);
		
		if(result1 > 0) {
			int bCode = ed.selectCurrval(con);
			
			int result2 = 0;
			for(int i = 0; i < fileList.size(); i++) {
				BoardAttachment ba = fileList.get(i);
				ba.setRefBCode(bCode);
				result2 += ed.insertAttachment(con, ba);
			}
			
			if(result2 == fileList.size()) {
				commit(con);
				result = 1;
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		
		return result;
	}

	public int updateEvent(Map<String, Object> requestData) {
		Connection con = getConnection();
		int result = 0;
		
		EventDao ed = new EventDao();
		Post post = (Post) requestData.get("post");
		ArrayList<BoardAttachment> fileList = (ArrayList<BoardAttachment>) requestData.get("fileList");
		
		int result1 = ed.updateEventContent(con, post);

		if(result1 > 0) {
			
			int result2 = 0;
			for(int i = 0; i < fileList.size(); i++) {
				BoardAttachment ba = fileList.get(i);
				
				if (i == 0) {
					ba.setRefBCode(post.getbCode());
					result2 += ed.updateThumbAttachment(con, ba);
					
				} else {
					ba.setRefBCode(post.getbCode());
					result2 += ed.updateContentAttachment(con, ba);					
				}
			}
			
			if(result2 == fileList.size()) {
				commit(con);
				result = 1;
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		
		return result;
	}

	public int deleteEvent(int bCode) {
		Connection con = getConnection();
		int result = 0;
		
		EventDao ed = new EventDao();
		
		int result1 = ed.deleteEventAttachment(con, bCode);
		
		if(result1 > 0) {
			
			int result2 = ed.deleteEventPost(con, bCode);
			
			if(result2 > 0) {
				commit(con);
				result = 1;
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		
		return result;
	}

}
