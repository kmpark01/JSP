package org.joonzis.dao;

import org.apache.ibatis.session.SqlSession;
import org.joonzis.mybatis.config.DBService;
import org.joonzis.vo.MemberVO;

public class MemberDaoImpl implements MemberDao {
	
	private static MemberDaoImpl instance = null;
	private MemberDaoImpl() {}

	public static MemberDao getInsatance() {
		if(instance == null) {
			instance = new MemberDaoImpl();
		}
		return instance;
	}
	
	// 필드
	private static SqlSession sqlsession = null;
	private synchronized static SqlSession getSqlSession() {
		if(sqlsession == null) {
			sqlsession = DBService.getFactory()
					.openSession(false);
		}
		return sqlsession;
	}

	@Override
	public int validateId(String mId) {
		return getSqlSession().selectOne("check_id", mId);
	}

	@Override
	public int insertMember(MemberVO mvo) {
		int result = getSqlSession().insert("insert_member", mvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}

	@Override
	public MemberVO checkMember(MemberVO mvo) {
		return getSqlSession().selectOne("check_member", mvo);
	}

	@Override
	public MemberVO memberInfo(MemberVO mvo) {
		return getSqlSession().selectOne("member_info", mvo);
	}

	@Override
	public int updateMember(MemberVO mvo) {
		int result = getSqlSession().update("update_member", mvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
}
