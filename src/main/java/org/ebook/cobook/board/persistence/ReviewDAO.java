package org.ebook.cobook.board.persistence;

import java.util.HashMap;
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
	
	//리뷰 전체 리스트 갯수 조회 (더보기 용)
	int getReviewListCnt(String searchType ) throws Exception;
	
	//리뷰 조회 > 조회 수 증가
	public void readReview(Integer review_no) throws Exception;
	
	//리뷰 싱글 페이지
	public Map<String, String> single(Integer review_no) throws Exception;
	
	//리뷰의 글쓴이가 작성한 다른 리뷰
	public List<ReviewVO> getWriterReviews(int member_no)throws Exception;

	//해당 도서의 다른 리뷰
	public List<ReviewVO> getOtherReviews(int ebook_no)throws Exception;
	
	
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
	
	

	
}
