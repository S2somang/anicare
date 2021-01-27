package org.anicare.jsp.education.model.Dao;

import static org.anicare.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import org.anicare.jsp.education.model.vo.BoardAttachment;
import org.anicare.jsp.education.model.vo.Post;
import org.anicare.jsp.introduction.model.vo.PageInfo;

public class MaterialsDao {
	private Properties prop = new Properties();
	
	public MaterialsDao() {
		String fileName = Post.class.getResource("/sql/education/materials-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int searchListCount(Connection con, String searchTitle, String searchContent) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("searchListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + searchTitle + "%");
			pstmt.setString(2, "%" + searchContent + "%");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectMaterials(Connection con, String searchTitle, String searchContent, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("selectMaterialsMap");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + searchTitle + "%");
			pstmt.setString(2, "%" + searchContent + "%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				
				hmap.put("bCode", rset.getInt("BCODE"));
				hmap.put("title", rset.getString("TITLE"));
				hmap.put("count", rset.getInt("COUNT"));
				hmap.put("content", rset.getString("CONTENT"));
				hmap.put("bnum", rset.getInt("BNUM"));
				hmap.put("btype", rset.getString("BTYPE"));
				hmap.put("bDate", rset.getDate("BDATE"));
				hmap.put("userId", rset.getString("USER_ID"));
				
				hmap.put("fCode", rset.getInt("FCODE"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				hmap.put("refBCode", rset.getInt("REF_BCODE"));
				hmap.put("uploadDate", rset.getDate("UPLOAD_DATE"));
				hmap.put("downloadCount", rset.getInt("DOWNLOAD_COUNT"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public HashMap<String, Object> selectDetailMaterials(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectDetailMaterials");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			
			ArrayList<BoardAttachment> list = new ArrayList<BoardAttachment>();
			Post post = new Post();
			
			while(rset.next()) {
				post.setbCode(rset.getInt("BCODE"));
				post.setTitle(rset.getString("TITLE"));
				post.setCount(rset.getInt("COUNT"));
				post.setContent(rset.getString("CONTENT"));
				post.setBnum(rset.getInt("BNUM"));
				post.setBtype(rset.getString("BTYPE"));
				post.setbDate(rset.getDate("BDATE"));
				post.setUserId(rset.getString("USER_ID"));
				post.setRefBcode(rset.getString("REF_BCODE"));
				
				BoardAttachment ba = new BoardAttachment();
				ba.setfCode(rset.getInt("FCODE"));
				ba.setOriginName(rset.getString("ORIGIN_NAME"));
				ba.setChangeName(rset.getString("CHANGE_NAME"));
				ba.setFilePath(rset.getString("FILE_PATH"));
				ba.setRefBCode(rset.getInt("REF_BCODE"));
				ba.setUploadDate(rset.getDate("UPLOAD_DATE"));
				ba.setDownloadCount(rset.getInt("DOWNLOAD_COUNT"));
				
				list.add(ba);
			}
			
			hmap.put("post", post);
			hmap.put("boardAttachment", list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return hmap;
	}

	public int insertMaterialsContent(Connection con, Post post) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMaterials");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setString(3, post.getUserId());
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int bCode = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				bCode = rset.getInt("CURRVAL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return bCode;
	}

	public int insertAttachment(Connection con, BoardAttachment ba) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ba.getOriginName());
			pstmt.setString(2, ba.getChangeName());
			pstmt.setString(3, ba.getFilePath());
			pstmt.setInt(4, ba.getRefBCode());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public BoardAttachment selectOneAttachment(Connection con, int bnum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BoardAttachment file = null;
		
		String query = prop.getProperty("selectOneAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bnum);
			
			rset = pstmt.executeQuery();
			
			file = new BoardAttachment();
			while(rset.next()) {
				file.setfCode(rset.getInt("FCODE"));
				file.setOriginName(rset.getString("ORIGIN_NAME"));
				file.setChangeName(rset.getString("CHANGE_NAME"));
				file.setFilePath(rset.getString("FILE_PATH"));
				file.setRefBCode(rset.getInt("REF_BCODE"));
				file.setUploadDate(rset.getDate("UPLOAD_DATE"));
				file.setDownloadCount(rset.getInt("DOWNLOAD_COUNT"));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return file;
	}

	public int updateMaterialsContent(Connection con, Post post) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMaterials");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setInt(3, post.getbCode());		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMaterialsAttachment(Connection con, BoardAttachment ba) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMaterialsAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ba.getOriginName());
			pstmt.setString(2, ba.getChangeName());
			pstmt.setInt(3, ba.getRefBCode());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMaterialsAttachment(Connection con, int bCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMaterialsAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bCode);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMaterialsPost(Connection con, int bCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMaterialsPost");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bCode);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
