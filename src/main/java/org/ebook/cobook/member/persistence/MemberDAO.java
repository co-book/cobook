package org.ebook.cobook.member.persistence;

import org.ebook.cobook.member.domain.MemberVO;

public interface MemberDAO {

	public void insertMember(MemberVO vo);
	
	// 한 사람에대한 정보를 가져오는 메서드
	public MemberVO getMember(MemberVO vo)throws Exception;
	
	public MemberVO getEmail(String email)throws Exception;
	
	public MemberVO getNickName(String nickname)throws Exception;
	
	public void updatePassword(MemberVO vo);
}
