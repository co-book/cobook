package org.ebook.cobook.board.persistence;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.ebook.domain.EbookVO;

public interface ReviewDAO {

	//리뷰 등록하기
	public int register(ReviewVO vo) throws Exception;
	
	//리뷰쓸 책 리스트 불러오기
	List<EbookVO> getEbookList(String search) throws Exception;

	//리뷰 리스트 불러오기
	List<ReviewVO> getReviewList(String searchType , int moreCnt) throws Exception;
	
	int getReviewListCnt(String searchType ) throws Exception;
	
	/////////////////////////////
	public List<Map<String, Object>> getBorrowedBook(Integer member_no) throws Exception;
	

	public List<Map<String, Object>> getBookReviewList(Criteria cri) throws Exception;
	public Map<String, Object> getReviewSingle(Integer review_no)throws Exception;
	public void modifyReview(ReviewVO vo)throws Exception;
	public void deleteReview(Integer review_no)throws Exception;
	public void increseHit(Integer review_no) throws Exception;
	public List<Map<String, Object>> getReviewPopularity(Criteria cri)throws Exception;
	// 좋아요 순 댓글 top6
	public List<Map<String, Object>> getBestReply();
	
	// 최근 리뷰
	public List<ReviewVO> getLastedReviewList()throws Exception;
	
	// same writer other reviews
	public List<ReviewVO> getSameWriterOtherReviews(int member_no)throws Exception;
	
	// same ebook other reviews
	public List<ReviewVO> getSameBookOtherReviews(int ebook_no)throws Exception;
	

	
}
