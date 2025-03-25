package org.joonzis.service;

import java.util.List;

import org.joonzis.dao.CDao;
import org.joonzis.dao.CDaoImpl;
import org.joonzis.vo.CVO;

public class CServiceImple implements CService{
	private CDao cdao = CDaoImpl.getInstance();
	
	@Override
	public int insertComment(CVO cvo) {
		return cdao.insertComment(cvo);
	}

	@Override
	public List<CVO> getCommentList(int b_idx) {
		return cdao.getCommentList(b_idx);
	}

	@Override
	public int deleteComment(int c_idx) {
		return cdao.deleteComment(c_idx);
	}

	@Override
	public int deleteAllComment(int b_idx) {
		return cdao.deleteAllComment(b_idx);
	}
}
