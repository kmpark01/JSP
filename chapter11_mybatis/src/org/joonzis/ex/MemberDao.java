package org.joonzis.ex;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.joonzis.mybatis.DBService;

public class MemberDao {
	// 필드
	private SqlSessionFactory factory = null;
	
	// 싱글톤
	// 기본 생성자(외부에서 접근할 수 없게 private 처리 )
	private MemberDao() {
		factory = DBService.getFactory();
	}
	private static MemberDao dao = new MemberDao();
	public static MemberDao getInstance() {
		return dao;
	}
	
	// 테이블 전체 목록을 가져오는 메소드 - getAllList
	public List<MemberVO> getAllList() {
		
		SqlSession session = factory.openSession();
		List<MemberVO> list = session.selectList("select_all");
		session.close();
		return list;
	}
	
	public int insert(MemberVO vo) {
		
		SqlSession session = factory.openSession(false);
		int result = session.insert("insert", vo);
		if(result > 0) {
			session.commit();
		}
		session.close();
		return result;
		
	}
	
	public int remove(MemberVO vo) {
		
		SqlSession session = factory.openSession(false);
		int result = session.delete("delete", vo);
		if(result > 0) {
			session.commit();
		}
		session.close();
		return result;
	}
	
	public MemberVO getUpdateView(MemberVO vo){
		
		SqlSession session = factory.openSession();
		MemberVO member = session.selectOne("select_update", vo);
		session.close();
		return member;
	}
	
	public int update(MemberVO vo) {
		
		SqlSession session = factory.openSession(false);
		int result = session.update("update", vo);
		if(result > 0) {
			session.commit();
		}
		session.close();
		return result;
	}
	
	public MemberVO search(MemberVO vo) {
		
		SqlSession session = factory.openSession();
		MemberVO member = session.selectOne("search", vo);
		session.close();
		return member;
	}
	
}




