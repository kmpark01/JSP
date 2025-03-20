package org.joonzis.dao;

import java.util.List;

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
	    // MyBatis에서 동적 쿼리 파라미터로 전달할 VO 객체 생성
	    EmployeeVO vo = new EmployeeVO();

	    // 조건에 따라 vo 객체에 값 설정
	    if ("name".equals(searchType)) {
	        vo.setFirst_name(searchQuery);  // 성명 검색
	    } else if ("department".equals(searchType)) {
	        vo.setDepartment_id(Integer.parseInt(searchQuery));  // 부서 번호 검색
	    } else if ("employee".equals(searchType)) {
	        vo.setEmployee_id(Integer.parseInt(searchQuery));  // 사원 번호 검색
	    }

	    // MyBatis 쿼리 실행
	    return getSqlSession().selectList("select_dynamic", vo);
	}
	
	
}
