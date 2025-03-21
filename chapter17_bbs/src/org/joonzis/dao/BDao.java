package org.joonzis.dao;

import java.util.List;

import org.joonzis.vo.BVO;

public interface BDao {
	public List<BVO> getList();
	
	public int InsertBBS(BVO vo);
	
}
