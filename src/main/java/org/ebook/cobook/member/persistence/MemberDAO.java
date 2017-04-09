package org.ebook.cobook.member.persistence;

import org.ebook.cobook.member.domain.MemberVO;

public interface MemberDAO {

	public void joinMember(MemberVO vo);
	
	public MemberVO getMember(MemberVO vo)throws Exception;
	
	public MemberVO getEmail(String email)throws Exception;
	
	public void modifyMember(MemberVO vo);
}
