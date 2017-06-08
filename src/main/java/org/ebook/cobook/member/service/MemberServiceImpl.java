package org.ebook.cobook.member.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.member.domain.MemberVO;
import org.ebook.cobook.member.persistence.MemberDAO;
import org.ebook.cobook.mypage.persistence.MyPageDAO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;
	@Inject
	private MyPageDAO mypageDAO;
	
	
	@Override
	public void joinMember(MemberVO vo) {
		// TODO Auto-generated method stub
		memberDAO.joinMember(vo);
	}

	@Override
	public int modifyMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.modifyMember(vo);
	}

	@Override
	public boolean checkEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		MemberVO member = memberDAO.getEmail(email);
		if (member != null) {
			return true;
		}

		return false;
	}

	@Override
	public MemberVO getMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMember(vo);
	}

/*	@Override
	public MemberVO getMyPoint(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		 
		return memberDAO.getMyPoint(vo);
	}
*/
	@Override
	public MemberVO chargePoint(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		memberDAO.chargePoint(vo);
		return memberDAO.getMyPoint(vo);
	}

	@Override
	public List<Map<String, Object>> getMyBookReviewList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getUserMybookList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public List<EbookVO> getMyborrowList(BorrowVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.getMyborrowList(vo);
	}

	/*@Override
	public List<Map<String, Object>> getMyborrowList(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.getMyborrowList(mvo);
	}*/

}
