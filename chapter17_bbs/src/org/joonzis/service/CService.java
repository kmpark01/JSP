package org.joonzis.service;

import java.util.List;

import org.joonzis.vo.CVO;

public interface CService {
	// 1. 댓글 등록
	public int insertComment(CVO cvo);
	
	// 2. 댓글 가져오기
	public List<CVO> getCommentList(int b_idx);
	
	// 3. 댓글 삭제
	public int deleteComment(int c_idx);
	
	// 4. 전체 댓글 삭제
	public int deleteAllComment(int b_idx);
}
