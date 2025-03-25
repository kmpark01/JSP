package org.joonzis.service;

import java.util.List;

import org.joonzis.model.Criteria;
import org.joonzis.vo.BVO;

public interface BService {
	// 전체 게시글
//	public List<BVO> getList();
	// 게시글 등록
	public int InsertBBS(BVO bvo);
	// 상세 페이지
	public BVO getBBS(int b_idx);
	// 게시글 수정
	public int updateBBS(BVO bvo);
	// 게시글 삭제
	public int removeBBS(int b_idx);
	// 게시글 댓글 전체 삭제
	public int removeBBSComment(int b_idx);
	// 조회 수 증가
	public void updateHit(BVO bvo);
	// 페이지징 추가
	public List<BVO> getListWithPaging(Criteria cri);
	public int getTotalRecordCount();
}







