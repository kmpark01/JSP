package org.joonzis.dao;

import java.util.List;

import org.joonzis.model.Criteria;
import org.joonzis.vo.BVO;

public interface BDao {
//	public List<BVO> getList();
	public int InsertBBS(BVO bvo);
	public BVO getBBS(int b_idx);
	public int updateBBS(BVO bvo);
	public int removeBBS(int b_idx);
	public int removeBBSComment(int b_idx);
	public void updateHit(BVO bvo);
	public List<BVO> getListWithPaging(Criteria cri);
	public int getTotalRecordCount();
}
