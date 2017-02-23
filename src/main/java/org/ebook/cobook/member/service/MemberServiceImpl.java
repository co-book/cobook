package org.ebook.cobook.member.service;

import javax.inject.Inject;

import org.ebook.cobook.member.domain.MemberVO;
import org.ebook.cobook.member.persistence.MemberDAO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void joinMember(MemberVO vo) {
		// TODO Auto-generated method stub
		memberDAO.insertMember(vo);
	}
	
	
	
	
	
	
	

}
