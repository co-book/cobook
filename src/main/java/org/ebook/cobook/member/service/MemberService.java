package org.ebook.cobook.member.service;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.member.domain.MemberVO;

public interface MemberService {

	public void joinMember(MemberVO vo);

	public int modifyMember(MemberVO vo);

	public boolean checkEmail(String email) throws Exception;
	
	public MemberVO getMember(MemberVO vo)throws Exception;

	//포인트 충전하기 
	/*public MemberVO getMyPoint(MemberVO vo) throws Exception;*/
	public MemberVO chargePoint(MemberVO vo) throws Exception;
	
	/*	마이페이지
	 * 
	 * 내가 작성한 리뷰 리스트
	 * 내가쓴 마이북 리뷰 리스트
	 * 내가 빌린 책 리스트
	 * public List<Map<String, Object>> getMyborrowList(MemberVO mvo)throws Exception;
	 */
	public List<Map<String, Object>> getMyBookReviewList(Map<String, Object> paramMap)throws Exception;
	public List<Map<String, Object>> getUserMybookList(Map<String, Object> paramMap)throws Exception;
	
	public List<EbookVO> getMyborrowList(BorrowVO vo)throws Exception;
	public int getMyBorrowCount(BorrowVO vo) throws Exception;
	
}
