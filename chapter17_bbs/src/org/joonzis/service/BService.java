package org.joonzis.service;

import java.util.List;

import org.joonzis.vo.BVO;

public interface BService {
	// 전체 게시글
	public List<BVO> getList();
	
	// 게시물 추가
	public int InsertBBS(BVO bvo);

}	
