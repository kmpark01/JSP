package org.joonzis.service;

import java.util.List;

import org.joonzis.dao.BDao;
import org.joonzis.dao.BDaoImpl;
import org.joonzis.vo.BVO;

public class BServiceImpl implements BService {
	
	private BDao bdao = BDaoImpl.getInstance();
	
	@Override
	public List<BVO> getList() {
		
		return bdao.getList();
	}

	@Override
	public int InsertBBS(BVO bvo) {
		return bdao.InsertBBS(bvo);
	}
}
