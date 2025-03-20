package org.joonzis.dao;

import java.util.List;

import org.joonzis.vo.EmployeeVO;

public interface EmployeeDao {
	public List<EmployeeVO> getAllEmployees();
	
	public List<EmployeeVO> getDeptEmployees(EmployeeVO vo);
	
	public List<EmployeeVO> getDynamincEmployees(String searchType, String searchQuery);
}
