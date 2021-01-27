package org.anicare.jsp.board.model.service;

import static org.anicare.jsp.common.JDBCTemplate.close;
import static org.anicare.jsp.common.JDBCTemplate.commit;
import static org.anicare.jsp.common.JDBCTemplate.getConnection;
import static org.anicare.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;

import org.anicare.jsp.board.model.dao.BoardDao;
import org.anicare.jsp.board.model.vo.Board;
import org.anicare.jsp.board.model.vo.Missing;
public class BoardService {
	public int insertFreeBoard(Board insertBoard) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertFreeBoard(con, insertBoard);
		
		if (result > 0) {
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<Board> selectFreeBoardList() {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectFreeBoardList(con);
		
		close(con);
		return list;
	}

	public ArrayList<Board> selectAdoptionBoardList() {
		Connection con = getConnection();
		ArrayList<Board> list = new BoardDao().selectAdoptionBoardList(con);
		
		close(con);
		return list;
	}

	public int insertAdoptionBoard(Board insertBoard) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertAdoptionBoard(con, insertBoard);
		if (result > 0) {
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Map<String, Object>> selectMissingBoardList() {
		Connection con = getConnection();
		ArrayList<Map<String, Object>> list = new BoardDao().selectMissingBoardList(con);
		
		close(con);
		return list;
	}

	public int insertMissingBoard(Map<String, Object> insertInfo) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertMissingBoard(con, insertInfo);
		
		if (result > 0) {
			commit(con);
		}
		else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int getFreeBoardListCount() {
		Connection con = getConnection();
		
		int freeBoardListCount = new BoardDao().getFreeBoardListCount(con);
		
		close(con);
		return freeBoardListCount;
	}

	public ArrayList<Board> selectFreeBoardListPagenation(Map<String, Integer> pageInfo) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectFreeBoardListPagenation(con, pageInfo);
		
		close(con);
		return list;
	}

	public int getAdoptionBoardListCount() {
		Connection con = getConnection();
		int adoptionBoardListCount = new BoardDao().getAdoptionBoardListCount(con);
		
		close(con);
		return adoptionBoardListCount;
	}

	public ArrayList<Board> selectAdoptionBoardListPagenation(Map<String, Integer> pageInfo) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAdoptionBoardListPagenation(con, pageInfo);
		close(con);
		return list;
	}

	public Board selectOneFreeBoard(int bCode) {
		Connection con = getConnection();
		BoardDao bd = new BoardDao();
		Board selectPost = null;
		int viewCount = bd.plustViewCount(con, bCode, "10");
		
		if (viewCount > 0) {
			selectPost = bd.selectOneFreeBoard(con, bCode);
			
			if (selectPost != null) {
				commit(con);
			}
			else {
				rollback(con);
			}
		}
		else {
			rollback(con);
		}
		
		close(con);
		
		return selectPost;
	}


	public ArrayList<Integer> selectBcodeCountListForPagenation(Map<String, Integer> pageInfo, int bType) {
		Connection con = getConnection();
		
		ArrayList<Integer> bCodeList = new BoardDao().selectBcodeCountListForPagenation(con, pageInfo, bType);
		close(con);
		
		return bCodeList;
	}

	public int insertReplyForFreeBoard(Board reply) {
		Connection con = getConnection();
		BoardDao bd = new BoardDao();
		int result = bd.insertReplyForFreeBoard(con, reply);
		
		if (result > 0) {
			bd.minusViewCount(con, reply.getbCode(), "10");
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<Integer> selectCommentCountList(ArrayList<Integer> bcodeList, String bType) {
		Connection con = getConnection();
		
		ArrayList<Integer> commentCountList = new BoardDao().selectCommentCountList(con, bcodeList, bType);
		close(con);
		
		return commentCountList;
	}

	public ArrayList<Board> selectReplyList(int bCode, String bType) {
		Connection con = getConnection();
		ArrayList<Board> replyList = new BoardDao().selectReplyList(con, bCode, bType);
		
		close(con);
		return replyList;
	}

	public Board selectOneAdoptionBoard(int bCode) {
		Connection con = getConnection();
		BoardDao bd = new BoardDao();
		Board selectPost = null;
		int viewCount = bd.plustViewCount(con, bCode, "40");
		
		if (viewCount > 0) {
			selectPost = bd.selectOneAdoptionBoard(con, bCode);
			
			if (selectPost != null) {
				commit(con);
			}
			else {
				rollback(con);
			}
		}
		else {
			rollback(con);
		}
		
		close(con);
		return selectPost;
	}

	public int insertReplyForAdoptionBoard(Board reply) {
		Connection con = getConnection();
		BoardDao bd = new BoardDao();
		int result = bd.insertReplyForAdoptionBoard(con, reply);
		
		if (result > 0) {
			bd.minusViewCount(con, reply.getbCode(), "40");
			commit(con);
		}
		else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int getMissingBoardListCount() {
		Connection con = getConnection();
		int missingBoardListCount = new BoardDao().getMissingBoardListCount(con);
		close(con);
		return missingBoardListCount;
	}

	public Map<String, Object> selectMissingBoardListPagenation(Map<String, Integer> pageInfo) {
		Connection con = getConnection();
		
		Map<String, Object> list = new BoardDao().selectMissingBoardListPagenation(con, pageInfo);
		close(con);
		return list;
	}

	public Map<String, Object> selectOneMissingBoard(int bCode) {
		Connection con = getConnection();
		BoardDao bd = new BoardDao();
		
		Map<String, Object> selectPost = null;
		
		int viewCount = bd.plustViewCount(con, bCode, "20");
		if (viewCount > 0) {
			selectPost = bd.selectOneMissingBoard(con, bCode);
			
			if (selectPost != null) {
				commit(con);
			}
			else {
				rollback(con);
			}
		}
		else {
			rollback(con);
		}
		close(con);
		return selectPost;
	}

	public int insertReplyForMissingBoard(Board reply) {
		Connection con = getConnection();
		BoardDao bd = new BoardDao();
		int result = bd.insertReplyForMissingBoard(con, reply);
		
		if (result > 0) {
			bd.minusViewCount(con, reply.getbCode(), "20");
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Board updateFreeBoard(Board b) {
		Connection con = getConnection();
		
		BoardDao bd = new BoardDao();
		
		Board changeBoard = null;
		int result = bd.updateFreeBoard(con, b);
		
		if (result > 0) {
			changeBoard = bd.selectOneFreeBoard(con, b.getbCode());
			if (changeBoard != null) {
				bd.minusViewCount(con, b.getbCode(), "10");
				commit(con);
			}
			else {
				rollback(con);
			}
		}
		else {
			rollback(con);
		}
		close(con);
		return changeBoard;
	}

	public Board updateAdoptionBoard(Board b) {
		Connection con = getConnection();
		
		BoardDao bd = new BoardDao();
		
		Board changeBoard = null;
		int result = bd.updateAdoptionBoard(con, b);
		
		if (result > 0) {
			changeBoard = bd.selectOneAdoptionBoard(con, b.getbCode());
			if (changeBoard != null) {
				bd.minusViewCount(con, b.getbCode(), "40");
				commit(con);
			}
			else {
				rollback(con);
			}
		}
		else {
			rollback(con);
		}
		close(con);
		
		return changeBoard;
	}

	public int updateMissingBoard(Map<String, Object> updateInfo) {
		Connection con = getConnection();
		
		BoardDao bd = new BoardDao();
		
		int result = 0;
		
		int result1 = bd.updateMissingBoardPartBoard(con, ((Board)updateInfo.get("BOARD")));
		
		if (result1 > 0) {
			int result2 = bd.updateMissingBoardPartMissing(con, ((Missing)updateInfo.get("MISSING")));
			
			if (result2 > 0) {
				bd.minusViewCount(con, ((Board)updateInfo.get("BOARD")).getbCode(), "20");
				result = 1;
				commit(con);
			}
			else {
				rollback(con);
			}
		}
		else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int deleteFreeBoard(int bCode, int cc) {
		Connection con = getConnection();
		
		int result = new BoardDao().deleteFreeBoard(con, bCode, cc);
		
		if (result > 0) {
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int deleteAdoptionBoard(int bCode, int cc) {
		Connection con = getConnection();
		int result = new BoardDao().deleteAdoptionBoard(con, bCode, cc);
		if (result > 0) {
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteMissingBoard(int bCode, int cc) {
		Connection con = getConnection();
		int result = 0;
		
		BoardDao bd = new BoardDao();
		int result1 = bd.deleteMissingBoardPartMissing(con, bCode);
		
		if (result1 > 0) {
			int result2 = bd.deleteMissingBoardPartBoard(con, bCode, cc);
			
			if (result2 > 0) {
				commit(con);
				result = 1;
			}
			else {
				rollback(con);
			}
		}
		else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Board updateReplyFreeBoard(Board b) {
		Connection con = getConnection();
		Board changeReply = null;
		
		BoardDao bd = new BoardDao();
		int result = bd.updateReplyFreeBoard(con, b);
		
		if (result > 0) {
			changeReply = bd.selectOneFreeBoard(con, b.getbCode());
			if (changeReply != null) {
				bd.minusViewCount(con, b.getRefBcode(), "10");
				commit(con);
			}
			rollback(con);
		}
		else {
			rollback(con);
		}
		close(con);
		
		return changeReply;
	}

	public int deleteReplyFreeBoard(int bCode, int refBcode) {
		Connection con = getConnection();
		BoardDao bd = new BoardDao();
		int result = bd.deleteReplyFreeBoard(con, bCode);
		
		if (result > 0) {
			bd.minusViewCount(con, refBcode, "10");
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public Board updateReplyAdoptionBoard(Board b) {
		Connection con = getConnection();
		Board changeReply = null;
		
		BoardDao bd = new BoardDao();
		int result = bd.updateReplyAdoptionBoard(con, b);
		
		if (result > 0) {
			changeReply = bd.selectOneAdoptionBoard(con, b.getbCode());
			if (changeReply != null) {
				bd.minusViewCount(con, b.getRefBcode(), "40");
				commit(con);
			}
			rollback(con);
		}
		else {
			rollback(con);
		}
		close(con);
		
		return changeReply;
	}

	public int deleteReplyAdoptionBoard(int bCode, int refBcode) {
		Connection con = getConnection();
		BoardDao bd = new BoardDao();
		int result = bd.deleteReplyAdoptionBoard(con, bCode);
		
		if (result > 0) {
			bd.minusViewCount(con, refBcode, "40");
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public Map<String, Object> updateReplyMissingBoard(Board b) {
		Connection con = getConnection();
		Map<String, Object> changeReply = null;
		
		BoardDao bd = new BoardDao();
		int result = bd.updateReplyMissingBoard(con, b);
		if (result > 0) {
			changeReply = bd.selectOneMissingBoard(con, b.getRefBcode());
			if (changeReply != null) {
				bd.minusViewCount(con, b.getRefBcode(), "20");
				commit(con);
			}
			rollback(con);
		}
		else {
			rollback(con);
		}
		close(con);
		
		return changeReply;
	}

	public int deleteReplyMissingBoard(int bCode, int refBcode) {
		Connection con = getConnection();
		BoardDao bd = new BoardDao();
		int result = bd.deleteReplyMissingBoard(con, bCode);
		
		if (result > 0) {
			bd.minusViewCount(con, refBcode, "20");
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<Board> searchFreeBoardList(String searchText) {
		Connection con = getConnection();
		ArrayList<Board> searchList = null;
		
		searchList = new BoardDao().searchFreeBoardList(con, searchText);
		
		close(con);
		
		return searchList;
	}

	public int getSearchFreeBoardListCount(String searchText) {
		Connection con = getConnection();
		int searchFreeBoardListCount = new BoardDao().getSearchFreeBoardListcount(con, searchText);
		
		close(con);
		return searchFreeBoardListCount;
	}

	public ArrayList<Board> searchFreeBoardListPagenation(Map<String, Integer> pageInfo, String searchText) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchFreeBoardListPagenation(con, pageInfo, searchText);
		
		close(con);
		return list;
	}

	public ArrayList<Integer> selectBcodeListForSearch(Map<String, Integer> pageInfo, String searchText, String bType) {
		Connection con = getConnection();
		
		ArrayList<Integer> bCodeList = new BoardDao().selectBcodeListForSearch(con, pageInfo, searchText, bType);
		close(con);
		
		return bCodeList;
	}

	public int getSearchAdoptionBoardListCount(String searchText) {
		Connection con = getConnection();
		int searchAdoptionBoardListCount = new BoardDao().getSearchAdoptionBoardListcount(con, searchText);
		
		close(con);
		return searchAdoptionBoardListCount;
	}

	public ArrayList<Board> searchAdoptionBoardListPagenation(Map<String, Integer> pageInfo, String searchText) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchAdoptionBoardListPagenation(con, pageInfo, searchText);
		
		close(con);
		return list;
	}

	public int getSearchMissingBoardListCount(String searchText) {
		Connection con = getConnection();
		int searchMissingBoardListCount = new BoardDao().getSearchMissingBoardListcount(con, searchText);
		
		close(con);
		return searchMissingBoardListCount;
	}

	public Map<String, Object> searchMissingBoardListPagenation(Map<String, Integer> pageInfo, String searchText) {
		Connection con = getConnection();
		
		Map<String, Object> list = new BoardDao().searchMissingBoardListPagenation(con, pageInfo, searchText);
		
		close(con);
		return list;
	}
}
