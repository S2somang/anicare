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
import org.anicare.jsp.education.model.Dao.MaterialsDao;
import org.anicare.jsp.education.model.vo.BoardAttachment;
import org.anicare.jsp.education.model.vo.Post;
import org.anicare.jsp.introduction.model.vo.PageInfo;

public class MaterialsService {

	public int getSearchListCount(String searchTitle, String searchContent) {
		Connection con = getConnection();
		int listCount = new MaterialsDao().searchListCount(con, searchTitle, searchContent);
		close(con);
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectMaterials(String searchTitle, String searchContent, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new MaterialsDao().selectMaterials(con, searchTitle, searchContent, pi);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectDetailMaterials(int num) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = null;
		MaterialsDao md = new MaterialsDao();
		
		int result = md.updateCount(con, num);
		
		if(result > 0) {
			
			hmap = md.selectDetailMaterials(con, num);
			
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

	public int insertMaterials(Map<String, Object> requestData) {
		Connection con = getConnection();
		int result = 0;
		
		MaterialsDao md = new MaterialsDao();
		Post post = (Post) requestData.get("post");
		ArrayList<BoardAttachment> fileList = (ArrayList<BoardAttachment>) requestData.get("fileList");
		
		int result1 = md.insertMaterialsContent(con, post);
		
		if(result1 > 0) {
			int bCode = md.selectCurrval(con);
			
			int result2 = 0;
			for(int i = 0; i < fileList.size(); i++) {
				BoardAttachment ba = fileList.get(i);
				ba.setRefBCode(bCode);
				result2 += md.insertAttachment(con, ba);
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

	public BoardAttachment selectOneAttachment(int bnum) {
		Connection con = getConnection();
		
		BoardAttachment file = new MaterialsDao().selectOneAttachment(con, bnum);
		
		close(con);
		
		return file;
	}

	public int updateMaterials(Map<String, Object> requestData) {
		Connection con = getConnection();
		int result = 0;
		
		MaterialsDao md = new MaterialsDao();
		Post post = (Post) requestData.get("post");
		ArrayList<BoardAttachment> fileList = (ArrayList<BoardAttachment>) requestData.get("fileList");
		
		int result1 = md.updateMaterialsContent(con, post);

		if(result1 > 0) {
			
			int result2 = 0;
			for(int i = 0; i < fileList.size(); i++) {
				BoardAttachment ba = fileList.get(i);
				
				ba.setRefBCode(post.getbCode());
				result2 += md.updateMaterialsAttachment(con, ba);
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

	public int deleteMaterials(int bCode) {
		Connection con = getConnection();
		int result = 0;
		
		MaterialsDao ed = new MaterialsDao();
		
		int result1 = ed.deleteMaterialsAttachment(con, bCode);
		
		if(result1 > 0) {
			
			int result2 = ed.deleteMaterialsPost(con, bCode);
			
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
