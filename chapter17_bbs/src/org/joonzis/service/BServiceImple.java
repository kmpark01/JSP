package org.joonzis.service;

import java.util.List;

import org.joonzis.dao.BDao;
import org.joonzis.dao.BDaoImpl;
import org.joonzis.vo.BVO;

public class BServiceImple implements BService{
	private BDao bdao = BDaoImpl.getInstance();
	
	@Override
	public List<BVO> getList() {
		return bdao.getList();
	}
	@Override
	public int InsertBBS(BVO bvo) {
		return bdao.InsertBBS(bvo);
	}
	@Override
	public BVO getBBS(int b_idx) {
		return bdao.getBBS(b_idx);
	}
	@Override
	public int updateBBS(BVO bvo) {
		return bdao.updateBBS(bvo);
	}
	@Override
	public int removeBBS(int b_idx) {
		return bdao.removeBBS(b_idx);
	}
	@Override
	public void updateHit(BVO bvo) {
		bdao.updateHit(bvo);
	}
}



