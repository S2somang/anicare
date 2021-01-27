package org.anicare.jsp.myPage.model.sevice;

import static org.anicare.jsp.common.JDBCTemplate.close;
import static org.anicare.jsp.common.JDBCTemplate.commit;
import static org.anicare.jsp.common.JDBCTemplate.getConnection;
import static org.anicare.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import org.anicare.jsp.member.model.vo.Member;
import org.anicare.jsp.myPage.model.dao.MyPageDao;
import org.anicare.jsp.myPage.model.vo.Info;
import org.anicare.jsp.myPage.model.vo.MyPage;

public class MyPageService {

	public MyPage getMySupportInfo(Member loginUser) {
		Connection con = getConnection();
		MyPage mp = new MyPageDao().getMySupportInfo(con, loginUser);

		if (mp != null) {
			commit(con);
		}
		else {
			rollback(con);
		}
		close(con);
		return mp;
	}

	public Member updateMyInfo(Member Loginuser, String requestId) {
		Connection con = getConnection();
		
		Member loginUser = new MyPageDao().updateMyInfo(con , Loginuser, requestId);
		if(loginUser != null ) {
			commit(con);
		}else {
			rollback(con);
			
		}
		close(con);
	
		return loginUser;
	}

	public ArrayList<Info> history() {
		Connection con = getConnection();
		
		ArrayList<Info> list = new MyPageDao().history(con);
		close(con);
		return list;
	}


}
