package org.joonzis.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.joonzis.mybatis.config.DBService;
import org.joonzis.vo.EmployeeVO;

public class EmployeeDaoImpl implements EmployeeDao{
	
	// DAO 객체 생성
	private static EmployeeDaoImpl instance = null;
	private EmployeeDaoImpl() {}

	public static EmployeeDaoImpl getInstance() {
		if(instance == null) {
			instance = new EmployeeDaoImpl();
		}
		return instance;
	}
	
	// 필드
	private static SqlSession sqlsession = null;
	private synchronized static SqlSession getSqlSession() {
		if(sqlsession == null) {
			sqlsession = DBService.getFactory().openSession(false);
		}
		return sqlsession;
	}

	@Override
	public List<EmployeeVO> getAllEmployees() {

		return getSqlSession().selectList("select_all");
	}

	@Override
	public List<EmployeeVO> getDeptEmployees(EmployeeVO vo) {
		return getSqlSession().selectList("select_dept", vo);
	}

	@Override
	public List<EmployeeVO> getDynamincEmployees(String searchType, String searchQuery) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("searchType", searchType);
	    
	    // 조건에 따라 적절한 값 설정
	    if ("name".equals(searchType)) {
	        paramMap.put("searchQuery", searchQuery);  // 성명 검색
	    } else if ("department".equals(searchType) || "employee".equals(searchType)) {
	        try {
	            paramMap.put("searchQuery", Integer.parseInt(searchQuery));  // 숫자 변환
	        } catch (NumberFormatException e) {
	            System.err.println("Invalid number format: " + searchQuery);
	            return new ArrayList<>();  // 빈 리스트 반환
	        }
	    }

	    // MyBatis 쿼리 실행
	    return getSqlSession().selectList("select_dynamic", paramMap);
	}
	
	
}
