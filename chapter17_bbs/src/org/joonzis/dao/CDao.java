package org.joonzis.dao;

import java.util.List;

import org.joonzis.vo.CVO;

public interface CDao {
	public int insertComment(CVO cvo);
	
	public List<CVO> getCommentList(int b_idx);
	
	public int deleteComment(int c_idx);
	
	public int deleteAllComment(int b_idx);
}
