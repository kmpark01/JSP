package org.joonzis.service;
import org.joonzis.dao.MemberDao;
import org.joonzis.dao.MemberDaoImpl;
import org.joonzis.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	
	private MemberDao mdao = MemberDaoImpl.getInsatance();

	@Override
	public int validateId(String mId) {
		return mdao.validateId(mId);
	}

	@Override
	public int insertMember(MemberVO mvo) {
		// TODO 자동 생성된 메소드 스텁
		return mdao.insertMember(mvo);
	}

	@Override
	public MemberVO checkMember(MemberVO mvo) {
		// TODO 자동 생성된 메소드 스텁
		return mdao.checkMember(mvo);
	}

	@Override
	public MemberVO memberInfo(MemberVO mvo) {
		return mdao.memberInfo(mvo);
	}

	@Override
	public int updateMember(MemberVO mvo) {
		return mdao.updateMember(mvo);
	}
}
