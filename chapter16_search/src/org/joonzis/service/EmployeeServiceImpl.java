package org.joonzis.service;

import java.util.List;

import org.joonzis.dao.EmployeeDao;
import org.joonzis.dao.EmployeeDaoImpl;
import org.joonzis.vo.EmployeeVO;

public class EmployeeServiceImpl implements EmployeeService {
	
	private EmployeeDao dao = EmployeeDaoImpl.getInstance();

	@Override
	public List<EmployeeVO> getAll() {
		return dao.getAllEmployees();
	}

	@Override
	public List<EmployeeVO> getDept(EmployeeVO vo) {
		return dao.getDeptEmployees(vo);
	}

	@Override
	public List<EmployeeVO> getDynamicSearch(String searchType, String searchQuery) {
		return dao.getDynamincEmployees(searchType, searchQuery);
	}
}
