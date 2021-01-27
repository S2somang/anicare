package org.anicare.jsp.member.model.service;

import static org.anicare.jsp.common.JDBCTemplate.close;
import static org.anicare.jsp.common.JDBCTemplate.commit;
import static org.anicare.jsp.common.JDBCTemplate.getConnection;
import static org.anicare.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;

import org.anicare.jsp.member.model.dao.MemberDao;
import org.anicare.jsp.member.model.vo.Member;

public class MemberService {

	public Member loginCheck(Member requestMember) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con ,requestMember);
		
		close(con);
		
		return loginUser;
		
		
		
	}

	public int idDuplicateCheck(String userId) {
		Connection con = getConnection();
		
		int result = new MemberDao().selectMemberCountby(con , userId);
		if(result >0 ) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}
	public int pwdDuplicateCheck(String pwd) {
		Connection con = getConnection();
		int result = new MemberDao().selectMemberCount(con, pwd);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int insertMember(Member newMember) {
		Connection con = getConnection();
		int result  = new MemberDao().insertMember(con , newMember);
		if(result > 0 ) {
			commit(con);
		}else {
			rollback(con);
			
		}
		close(con);
		return result;
	}

	public int insertMemberBn(Member newMember) {
		Connection con = getConnection();
		int result = new MemberDao().insertMemberBn( con , newMember);
		if(result > 0 	) {
			commit(con);
			
		}else {
			rollback(con);
		}
		
		return result;
	}


}
