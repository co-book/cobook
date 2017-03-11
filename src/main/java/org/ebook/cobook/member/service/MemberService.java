package org.ebook.cobook.member.service;

import org.ebook.cobook.member.domain.MemberVO;

public interface MemberService {

	public void joinMember(MemberVO vo);

	public void modifyMember(MemberVO vo);

	public boolean checkEmail(String email) throws Exception;

	public boolean checkNickName(String nickname) throws Exception;
	
	public MemberVO getMember(MemberVO vo)throws Exception;

}
