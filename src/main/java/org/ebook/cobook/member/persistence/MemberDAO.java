package org.ebook.cobook.member.persistence;

import org.ebook.cobook.member.domain.MemberVO;

public interface MemberDAO {

	public void joinMember(MemberVO vo);
	
	public MemberVO getMember(MemberVO vo)throws Exception;
	
	public MemberVO getEmail(String email)throws Exception;
	
	public int modifyMember(MemberVO vo);
	
	//포인트 충전하기 
	public MemberVO getMyPoint(MemberVO vo) throws Exception;
	public void chargePoint(MemberVO vo) throws Exception;

}
