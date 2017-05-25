package org.ebook.cobook.member.service;

import org.ebook.cobook.member.domain.MemberVO;

public interface MemberService {

	public void joinMember(MemberVO vo);

	public void modifyMember(MemberVO vo);

	public boolean checkEmail(String email) throws Exception;
	
	public MemberVO getMember(MemberVO vo)throws Exception;

	//포인트 충전하기 
	/*public MemberVO getMyPoint(MemberVO vo) throws Exception;*/
	public MemberVO chargePoint(MemberVO vo) throws Exception;
}
