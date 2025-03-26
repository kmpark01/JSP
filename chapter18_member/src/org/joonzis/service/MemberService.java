package org.joonzis.service;

import org.joonzis.vo.MemberVO;

public interface MemberService {
	public int validateId(String mId);

	public int insertMember(MemberVO mvo);
	
	public String checkMember(MemberVO mvo);
}
