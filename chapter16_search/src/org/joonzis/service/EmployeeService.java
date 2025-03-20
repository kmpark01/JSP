package org.joonzis.service;

import java.util.List;

import org.joonzis.vo.EmployeeVO;

public interface EmployeeService {
	public List<EmployeeVO> getAll();
	
	public List<EmployeeVO> getDept(EmployeeVO vo);
	
	public List<EmployeeVO> getDynamicSearch(String searchType, String searchQuery);
}
