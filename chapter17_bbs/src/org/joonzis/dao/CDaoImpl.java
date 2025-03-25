package org.joonzis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.joonzis.mybatis.config.DBService;
import org.joonzis.vo.CVO;

public class CDaoImpl implements CDao{
	// DAO 객체 생성
	private static CDaoImpl instance = null;
	private CDaoImpl() {}
	public static CDaoImpl getInstance() {
		if(instance == null) {
			instance = new CDaoImpl();
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
	public int insertComment(CVO cvo) {
		int result = getSqlSession().insert("insert_comment", cvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result; 
	}
	
	@Override
	public List<CVO> getCommentList(int b_idx) {
		return getSqlSession().selectList("select_comment", b_idx);
	}
	@Override
	public int deleteComment(int c_idx) {
		
		int result = getSqlSession().delete("delete_comment", c_idx);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result; 
	}
	@Override
	public int deleteAllComment(int b_idx) {
		
		int result = getSqlSession().delete("delete_all_comment", b_idx);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
}
