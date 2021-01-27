package org.anicare.jsp.introduction.model.service;

import static org.anicare.jsp.common.JDBCTemplate.close;
import static org.anicare.jsp.common.JDBCTemplate.commit;
import static org.anicare.jsp.common.JDBCTemplate.getConnection;
import static org.anicare.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import org.anicare.jsp.introduction.model.dao.NoticeDao;
import org.anicare.jsp.introduction.model.vo.IntroNotice;
import org.anicare.jsp.introduction.model.vo.PageInfo;

public class NoticeService {

	public ArrayList<IntroNotice> selectNoticeList() {
		Connection con = getConnection();
		
		ArrayList<IntroNotice> list = new NoticeDao().selectNoticeList(con);
		
		close(con);
		
		return list;
	}

	public int insertNotice(IntroNotice newNotice) {
		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con, newNotice);

		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public IntroNotice selectOneNoticeByNcode(String num) {
		Connection con = getConnection();
		NoticeDao nd = new NoticeDao();
		IntroNotice notice = null;
		
		int result = nd.updateCount(con, num);
		
		if(result > 0) {
			
			notice = nd.selectOneNoticeByNcode(con, num);
			if(notice != null) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		close(con);
		
		return notice;
	}

	public int updateNotice(IntroNotice changedNotice) {
		Connection con = getConnection();
		
		int result = new NoticeDao().updateNotice(con, changedNotice);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	public int deleteNotice(String ncode) {
		Connection con = getConnection();
		
		int result = new NoticeDao().deleteNotice(con, ncode);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new NoticeDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<IntroNotice> selectNoticeListWithPaging(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<IntroNotice> list = new NoticeDao().selectNoticeListWithPaging(con, pi);
		
		close(con);
		
		return list;
	}

	public ArrayList<IntroNotice> searchNotice(String searchingFor, String category, PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<IntroNotice> list = new NoticeDao().searchNotice(con, searchingFor, category, pi);
		
		close(con);
		
		return list;
	}

	public int getSearchListCount(String searchingFor, String category) {
		Connection con = getConnection();
		
		int listCount = new NoticeDao().searchListCount(con, searchingFor, category);
		
		close(con);
		
		return listCount;
	}

}
