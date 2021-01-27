package org.anicare.jsp.board.model.dao;

import static org.anicare.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.anicare.jsp.board.model.vo.Board;
import org.anicare.jsp.board.model.vo.Missing;

public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao() {
		String path = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(path));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertFreeBoard(Connection con, Board insertBoard) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFreeBoard");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, insertBoard.getTitle());
			pstmt.setString(2, insertBoard.getContent());
			pstmt.setString(3, insertBoard.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Board> selectFreeBoardList(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectFreeBoardList");
		
		try {
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			while(rs.next()) {
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				b.setName(rs.getString("NAME"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return list;
	}
	public ArrayList<Board> selectAdoptionBoardList(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAdoptionBoardList");
		
		try {
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			while(rs.next()) {
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return list;
	}
	public int insertAdoptionBoard(Connection con, Board insertBoard) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertAdoptionBoard");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, insertBoard.getTitle());
			pstmt.setString(2, insertBoard.getContent());
			pstmt.setString(3, insertBoard.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Map<String, Object>> selectMissingBoardList(Connection con) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Map<String, Object>> list = null;
		
		String query = prop.getProperty("selectMissingBoardList");
		
		try {
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			while(rs.next()) {
				Board b = new Board();
				Missing m = new Missing();
				
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				
				m.setInfo(rs.getString("INFO"));
				m.setmDate(rs.getDate("MDATE"));
				m.setMap(rs.getString("MAP"));
				m.setbCode(rs.getInt("BCODE"));
				
				Map<String, Object> el = new HashMap<>();
				el.put("BOARD", b);
				el.put("MISSING", m);
				
				list.add(el);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	public int insertMissingBoard(Connection con, Map<String, Object> insertInfo) {
		PreparedStatement pstmt = null;
		int check1 = 0, check2 = 0;
		
		try {
			String query = prop.getProperty("insertBoardToMissingBoard");
			pstmt = con.prepareStatement(query);
			
			Board b = (Board) insertInfo.get("BOARD");
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setString(3, b.getUserId());
			
			check1 = pstmt.executeUpdate();
			close(pstmt);
			
			query = prop.getProperty("insertMissingToMissingBoard");
			pstmt = con.prepareStatement(query);
			
			Missing m = (Missing) insertInfo.get("MISSING");
			pstmt.setString(1, m.getInfo());
			pstmt.setDate(2, m.getmDate());
			pstmt.setString(3, m.getMap());
			pstmt.setString(4, m.getmTime());
			
			check2 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return (check1 > 0 && check2 > 0) ? 1 : 0;
	}
	public int getFreeBoardListCount(Connection con) {
		Statement stmt = null;
		int freeBoardListCount = 0;
		ResultSet rs = null;
		
		String query = prop.getProperty("getFreeBoardListCount");
		
		try {
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				freeBoardListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return freeBoardListCount;
	}
	public ArrayList<Board> selectFreeBoardListPagenation(Connection con, Map<String, Integer> pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectFreeBoardListPagenation");
		
		int startNum = (pageInfo.get("cp") - 1) * pageInfo.get("limit") + 1;
		int endNum = startNum + pageInfo.get("limit") - 1;
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rs.next()) {
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				b.setName(rs.getString("NAME"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int getAdoptionBoardListCount(Connection con) {
		Statement stmt = null;
		int adoptionBoardListCount = 0;
		ResultSet rs = null;
		
		String query = prop.getProperty("getAdoptionBoardListCount");
		
		try {
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				adoptionBoardListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return adoptionBoardListCount;
	}
	public ArrayList<Board> selectAdoptionBoardListPagenation(Connection con, Map<String, Integer> pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectAdoptionBoardListPagenation");
		
		int startNum = (pageInfo.get("cp") - 1) * pageInfo.get("limit") + 1;
		int endNum = startNum + pageInfo.get("limit") - 1;
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rs.next()) {
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				b.setName(rs.getString("NAME"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public Board selectOneFreeBoard(Connection con, int bCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board selectPost = null;
		
		String query = prop.getProperty("selectOneFreeBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bCode);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				selectPost = new Board();
				
				selectPost.setbCode(rs.getInt("BCODE"));
				selectPost.setTitle(rs.getString("TITLE"));
				selectPost.setCount(rs.getInt("COUNT"));
				selectPost.setContent(rs.getString("CONTENT"));
				selectPost.setbNum(rs.getInt("BNUM"));
				selectPost.setbType(rs.getString("BTYPE"));
				selectPost.setbDate(rs.getDate("BDATE"));
				selectPost.setUserId(rs.getString("USER_ID"));
				selectPost.setEmail(rs.getString("EMAIL"));
				selectPost.setName(rs.getString("NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return selectPost;
	}
	public ArrayList<Integer> selectBcodeCountListForPagenation(Connection con, Map<String, Integer> pageInfo, int bType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> bCodeList = null;
		String query = "";
		switch(bType) {
		case 10:
			query = prop.getProperty("getFreeBoardBcodeCountList");
			break;
		case 20:
			query = prop.getProperty("getMissingBoardBcodeCountList");
			break;
		case 30:
			break;
		case 40:
			query = prop.getProperty("getAdoptionBoardBcodeCountList");
			break;
		}
		int startNum = (pageInfo.get("cp") - 1) * pageInfo.get("limit") + 1;
		int endNum = startNum + pageInfo.get("limit") - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			bCodeList = new ArrayList<>();
			
			while (rs.next()) {
				bCodeList.add(rs.getInt("BCODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return bCodeList;
	}
	public int insertReplyForFreeBoard(Connection con, Board reply) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReplyForFreeBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, reply.getContent());
			pstmt.setString(2, reply.getUserId());
			pstmt.setInt(3, reply.getbCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Integer> selectCommentCountList(Connection con, ArrayList<Integer> bcodeList, String bType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> commentCountList = null;
		
		String query = prop.getProperty("selectCommentCountList");
		commentCountList = new ArrayList<>();
		for (int i = 0; i < bcodeList.size(); i++) {
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, bType);
				pstmt.setInt(2, bcodeList.get(i));
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					commentCountList.add(rs.getInt(1));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		
		return commentCountList;
	}
	public ArrayList<Board> selectReplyList(Connection con, int bCode, String bType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> replyList = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, bType);
			pstmt.setInt(2, bCode);
			
			rs = pstmt.executeQuery();
			
			replyList = new ArrayList<>();
			while(rs.next()) {
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setContent(rs.getString("CONTENT"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				b.setName(rs.getString("NAME"));
				b.setRefBcode(bCode);
				
				replyList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return replyList;
	}
	public Board selectOneAdoptionBoard(Connection con, int bCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board selectPost = null;
		
		String query = prop.getProperty("selectOneAdoptionsBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bCode);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				selectPost = new Board();
				
				selectPost.setbCode(rs.getInt("BCODE"));
				selectPost.setTitle(rs.getString("TITLE"));
				selectPost.setCount(rs.getInt("COUNT"));
				selectPost.setContent(rs.getString("CONTENT"));
				selectPost.setbNum(rs.getInt("BNUM"));
				selectPost.setbType(rs.getString("BTYPE"));
				selectPost.setbDate(rs.getDate("BDATE"));
				selectPost.setUserId(rs.getString("USER_ID"));
				selectPost.setEmail(rs.getString("EMAIL"));
				selectPost.setName(rs.getString("NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return selectPost;
	}
	public int insertReplyForAdoptionBoard(Connection con, Board reply) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReplyForAdoptionBoard");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, reply.getContent());
			pstmt.setString(2, reply.getUserId());
			pstmt.setInt(3, reply.getbCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int getMissingBoardListCount(Connection con) {
		Statement stmt = null;
		int missingBoardListCount = 0;
		ResultSet rs = null;
		
		String query = prop.getProperty("getMissingBoardListCount");
		
		try {
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				missingBoardListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return missingBoardListCount;
	}
	public Map<String, Object> selectMissingBoardListPagenation(Connection con, Map<String, Integer> pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<String, Object> list = null;
		ArrayList<Board> boardList = null;
		ArrayList<Missing> missingList = null;
		
		String query = prop.getProperty("selectMissingBoardListPagenation");
		
		int startNum = (pageInfo.get("cp") - 1) * pageInfo.get("limit") + 1;
		int endNum = startNum + pageInfo.get("limit") - 1;
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			boardList = new ArrayList<>();
			missingList = new ArrayList<>();
			
			while(rs.next()) {
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				b.setEmail(rs.getString("EMAIL"));
				b.setName(rs.getString("NAME"));
				
				boardList.add(b);
				
				Missing m = new Missing();
				m.setbCode(rs.getInt("BCODE"));
				m.setInfo(rs.getString("INFO"));
				m.setmDate(rs.getDate("MDATE"));
				m.setMap(rs.getString("MAP"));
				m.setmTime(rs.getString("MTIME"));
				
				missingList.add(m);
			}
			list = new HashMap<>();
			list.put("boardList", boardList);
			list.put("missingList", missingList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public Map<String, Object> selectOneMissingBoard(Connection con, int bCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<String, Object> selectPost = null;
		
		String query = prop.getProperty("selectOneMissingBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bCode);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				selectPost = new HashMap<>();
				
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				b.setEmail(rs.getString("EMAIL"));
				b.setName(rs.getString("NAME"));
				
				Missing m = new Missing();
				m.setInfo(rs.getString("INFO"));
				m.setmDate(rs.getDate("MDATE"));
				m.setMap(rs.getString("MAP"));
				m.setmTime(rs.getString("MTIME"));
				
				selectPost.put("BOARD", b);
				selectPost.put("MISSING", m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return selectPost;
	}
	public int insertReplyForMissingBoard(Connection con, Board reply) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReplyForMissingBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, reply.getContent());
			pstmt.setString(2, reply.getUserId());
			pstmt.setInt(3, reply.getbCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int plustViewCount(Connection con, int bCode, String bType) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("plusViewCount");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bCode);
			pstmt.setString(2, bType);
			pstmt.setInt(3, bCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateFreeBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateFreeBoard");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getbCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int minusViewCount(Connection con, int bCode, String bType) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("minusViewCount");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bCode);
			pstmt.setString(2, bType);
			pstmt.setInt(3, bCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateAdoptionBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAdoptionBoard");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getbCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int updateMissingBoardPartBoard(Connection con, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMissingBoardPartBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getbCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateMissingBoardPartMissing(Connection con, Missing missing) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMissingBoardPartMissing");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, missing.getInfo());
			pstmt.setDate(2, missing.getmDate());
			pstmt.setString(3, missing.getMap());
			pstmt.setString(4, missing.getmTime());
			pstmt.setInt(5, missing.getbCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteFreeBoard(Connection con, int bCode, int cc) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		// Exist Reply Together Delete
		// Different Process, via Reply Exist 
		
		String query = (cc > 0) 
				? prop.getProperty("deleteFreeBoardExistReply") 
				: prop.getProperty("deleteFreeBoardNotExistReply");
		try {
			pstmt = con.prepareStatement(query);
			
			if (cc > 0) {
				pstmt.setInt(1, bCode);
				pstmt.setInt(2, bCode);
			}
			else {
				pstmt.setInt(1, bCode);
			}
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteAdoptionBoard(Connection con, int bCode, int cc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = (cc > 0) 
				? prop.getProperty("deleteAdoptionBoardExistReply") 
				: prop.getProperty("deleteAdoptionBoardNotExistReply");
		try {
			pstmt = con.prepareStatement(query);
			
			if (cc > 0) {
				pstmt.setInt(1, bCode);
				pstmt.setInt(2, bCode);
			}
			else {
				pstmt.setInt(1, bCode);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteMissingBoardPartBoard(Connection con, int bCode, int cc) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = (cc > 0) 
				? prop.getProperty("deleteMissingBoardPartExistReply") 
				: prop.getProperty("deleteMissingBoardPartNotExistReply");
		
		try {
			pstmt = con.prepareCall(query);
			
			if (cc > 0) {
				pstmt.setInt(1, bCode);
				pstmt.setInt(2, bCode);
			}
			else {
				pstmt.setInt(1, bCode);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteMissingBoardPartMissing(Connection con, int bCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMissingBoardPartMissing");
		
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
	public int updateReplyFreeBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReplyFreeBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getContent());
			pstmt.setInt(2, b.getRefBcode());
			pstmt.setInt(3, b.getbCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteReplyFreeBoard(Connection con, int bCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReplyFreeBoard");
		
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
	public int updateReplyAdoptionBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReplyAdoptionBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getContent());
			pstmt.setInt(2, b.getRefBcode());
			pstmt.setInt(3, b.getbCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteReplyAdoptionBoard(Connection con, int bCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReplyAdoptionBoard");
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
	public int updateReplyMissingBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReplyMissingBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getContent());
			pstmt.setInt(2, b.getRefBcode());
			pstmt.setInt(3, b.getbCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteReplyMissingBoard(Connection con, int bCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReplyMissingBoard");
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
	public ArrayList<Board> searchFreeBoardList(Connection con, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> searchList = null;
		
		String query = prop.getProperty("searchFreeBoardList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "%" + searchText + "%");
			
			rs = pstmt.executeQuery();
			
			searchList = new ArrayList<>();
			while(rs.next()) {
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				b.setName(rs.getString("NAME"));
				
				searchList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchList;
	}
	public int getSearchFreeBoardListcount(Connection con, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int searchFreeBoardListCount = 0;
		String query = prop.getProperty("getSearchFreeBoardListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "%" + searchText + "%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				searchFreeBoardListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return searchFreeBoardListCount;
	}
	public ArrayList<Board> searchFreeBoardListPagenation(Connection con, Map<String, Integer> pageInfo, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("searchFreeBoardListPagenation");
		
		int startNum = (pageInfo.get("cp") - 1) * pageInfo.get("limit") + 1;
		int endNum = startNum + pageInfo.get("limit") - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "%" + searchText + "%");
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rs.next()) {
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				b.setName(rs.getString("NAME"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Integer> selectBcodeListForSearch(Connection con, Map<String, Integer> pageInfo, String searchText,
			String bType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> bCodeList = null;
		
		String query = "";
		switch(bType) {
		case "10":
			query = prop.getProperty("getFreeBoardBcodeCountListForSearch");
			break;
		case "20":
			query = prop.getProperty("getMissingBoardBcodeCountListForSearch");
			break;
		case "30":
			break;
		case "40":
			query = prop.getProperty("getAdoptionBoardBcodeCountListForSearch");
			break;
		}
		int startNum = (pageInfo.get("cp") - 1) * pageInfo.get("limit") + 1;
		int endNum = startNum + pageInfo.get("limit") - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "%" + searchText + "%");
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			rs = pstmt.executeQuery();
			bCodeList = new ArrayList<>();
			
			while (rs.next()) {
				bCodeList.add(rs.getInt("BCODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return bCodeList;
	}
	public int getSearchAdoptionBoardListcount(Connection con, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int searchAdoptionBoardListCount = 0;
		String query = prop.getProperty("getSearchAdoptionBoardListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "%" + searchText + "%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				searchAdoptionBoardListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return searchAdoptionBoardListCount;
	}
	public ArrayList<Board> searchAdoptionBoardListPagenation(Connection con, Map<String, Integer> pageInfo,
			String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("searchAdoptionBoardListPagenation");
		
		int startNum = (pageInfo.get("cp") - 1) * pageInfo.get("limit") + 1;
		int endNum = startNum + pageInfo.get("limit") - 1;
		
		System.out.println("startNum : " + startNum);
		System.out.println("endNum : " + endNum);
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "%" + searchText + "%");
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rs.next()) {
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				b.setName(rs.getString("NAME"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int getSearchMissingBoardListcount(Connection con, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int searchMissingBoardListCount = 0;
		String query = prop.getProperty("getSearchMissingBoardListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "%" + searchText + "%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				searchMissingBoardListCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return searchMissingBoardListCount;
	}
	public Map<String, Object> searchMissingBoardListPagenation(Connection con, Map<String, Integer> pageInfo,
			String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<String, Object> list = null;
		
		ArrayList<Board> boardList = null;
		ArrayList<Missing> missingList = null;
		
		String query = prop.getProperty("searchMissingBoardListPagenation");
		
		int startNum = (pageInfo.get("cp") - 1) * pageInfo.get("limit") + 1;
		int endNum = startNum + pageInfo.get("limit") - 1;
		
		System.out.println("startNum : " + startNum);
		System.out.println("endNum : " + endNum);
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "%" + searchText + "%");
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			rs = pstmt.executeQuery();
			
			boardList = new ArrayList<>();
			missingList = new ArrayList<>();
			while(rs.next()) {
				Board b = new Board();
				b.setbCode(rs.getInt("BCODE"));
				b.setTitle(rs.getString("TITLE"));
				b.setCount(rs.getInt("COUNT"));
				b.setContent(rs.getString("CONTENT"));
				b.setbNum(rs.getInt("BNUM"));
				b.setbType(rs.getString("BTYPE"));
				b.setbDate(rs.getDate("BDATE"));
				b.setUserId(rs.getString("USER_ID"));
				b.setEmail(rs.getString("EMAIL"));
				b.setName(rs.getString("NAME"));
				
				boardList.add(b);
				
				Missing m = new Missing();
				m.setbCode(rs.getInt("BCODE"));
				m.setInfo(rs.getString("INFO"));
				m.setmDate(rs.getDate("MDATE"));
				m.setMap(rs.getString("MAP"));
				m.setmTime(rs.getString("MTIME"));
				
				missingList.add(m);
			}
			list = new HashMap<>();
			list.put("boardList", boardList);
			list.put("missingList", missingList);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
}
