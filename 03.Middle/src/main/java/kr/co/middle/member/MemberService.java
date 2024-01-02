package kr.co.middle.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired private SqlSession sql;
	
	public MemberVO member_info(String user_id) {
		return sql.selectOne("mb.info", user_id);
	}
}
