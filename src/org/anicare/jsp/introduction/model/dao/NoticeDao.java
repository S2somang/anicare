package org.anicare.jsp.introduction.model.dao;

import static org.anicare.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import org.anicare.jsp.introduction.model.vo.IntroNotice;
import org.anicare.jsp.introduction.model.vo.PageInfo;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = IntroNotice.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<IntroNotice> selectNoticeList(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<IntroNotice> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<IntroNotice>();
			
			while(rset.next()) {
				IntroNotice in = new IntroNotice();
				in.setNcode(rset.getString("NCODE"));
				in.setTitle(rset.getString("TITLE"));
				in.setCount(rset.getInt("COUNT"));
				in.setContent(rset.getString("CONTENT"));
				in.setDate(rset.getDate("DATE"));
				in.setCategory(rset.getString("CATEGORY"));
				in.setBcode(rset.getInt("BCODE"));
				
				list.add(in);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public int insertNotice(Connection con, IntroNotice newNotice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newNotice.getTitle());
			pstmt.setString(2, newNotice.getContent());
			pstmt.setString(3, newNotice.getCategory());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateCount(Connection con, String num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			pstmt.setString(2, num);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public IntroNotice selectOneNoticeByNcode(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		IntroNotice notice = null;
		
		String query = prop.getProperty("selectOneNoticeByNcode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			
			rset = pstmt.executeQuery();
			
			notice = new IntroNotice();
			while(rset.next()) {
				notice = new IntroNotice();
				
				notice.setNcode(rset.getString("NCODE"));
				notice.setTitle(rset.getString("TITLE"));
				notice.setCount(rset.getInt("COUNT"));
				notice.setContent(rset.getString("CONTENT"));
				notice.setDate(rset.getDate("DATE"));
				notice.setCategory(rset.getString("CATEGORY"));
				notice.setBcode(rset.getInt("BCODE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return notice;
	}

	public int updateNotice(Connection con, IntroNotice changedNotice) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, changedNotice.getTitle());
			pstmt.setString(2, changedNotice.getCategory());
			pstmt.setString(3, changedNotice.getContent());
			pstmt.setString(4, changedNotice.getNcode());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteNotice(Connection con, String ncode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ncode);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<IntroNotice> selectNoticeListWithPaging(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<IntroNotice> list = null;
		
		String query = prop.getProperty("selectNoticeListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<IntroNotice>();
			while(rset.next()) {
				IntroNotice in = new IntroNotice();
				in.setNcode(rset.getString("NCODE"));
				in.setTitle(rset.getString("TITLE"));
				in.setCount(rset.getInt("COUNT"));
				in.setContent(rset.getString("CONTENT"));
				in.setDate(rset.getDate("DATE"));
				in.setCategory(rset.getString("CATEGORY"));
				in.setBcode(rset.getInt("BCODE"));
				
				list.add(in);
			}
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<IntroNotice> searchNotice(Connection con, String searchingFor, String category, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<IntroNotice> list = null;
		
		String query = prop.getProperty("searchNotice");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + searchingFor + "%");
			pstmt.setString(2, "%" + searchingFor + "%");
			pstmt.setString(3, "%" + category + "%");
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<IntroNotice>();
			while(rset.next()) {
				IntroNotice in = new IntroNotice();
				in.setNcode(rset.getString("NCODE"));
				in.setTitle(rset.getString("TITLE"));
				in.setCount(rset.getInt("COUNT"));
				in.setContent(rset.getString("CONTENT"));
				in.setDate(rset.getDate("DATE"));
				in.setCategory(rset.getString("CATEGORY"));
				in.setBcode(rset.getInt("BCODE"));
				
				list.add(in);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int searchListCount(Connection con, String searchingFor, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("searchListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + searchingFor + "%");
			pstmt.setString(2, "%" + searchingFor + "%");
			pstmt.setString(3, "%" + category + "%");
			
			
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

}
