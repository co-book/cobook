package org.ebook.cobook.board.service;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.ebook.cobook.reply.domain.ReplyVO;

public interface ReviewService {

	// 내가 빌린책 리스트
	public List<Map<String, Object>> borrowBookList(Integer member_no)throws Exception;
	
	// 리뷰 글 등록
	public void writeReview(ReviewVO reviewVO, FilesVO filesVO)throws Exception;
	
	// 리뷰 게시물 리스트
	public List<Map<String, Object>> getBookReviewList(Criteria cri) throws Exception;

	// 게시물 총 개수 가져오기
	public int getBookReviewCount(Criteria cri) throws Exception;
	
	// 해당 게시물 가져오기
	public Map<String, Object> getReviewSingle(Integer review_no)throws Exception;
	
	// 게시물 수정하기
	public void modifyBookReview(ReviewVO reviewVO, FilesVO filesVO)throws Exception;
	
	// 게시물 삭제하기
	public void deleteReview(Integer reviewVO, FilesVO filesVO)throws Exception;
	
	// 인기 게시물 리스트 가지고오기
	public List<Map<String, Object>> getReviewPopularity(Criteria cri)throws Exception;
	
	// 리플 총 개수
	public int getReplyCount(ReplyVO vo)throws Exception;

	// 최근 리뷰
	public List<ReviewVO> getlastedReviewList()throws Exception;
	
	// 베스트 댓글 top6
	public List<Map<String, Object>> getBestReply();

	// 내가 쓴 후기 리스트
	public List<Map<String, Object>> getMyBookReviewList(Map<String, Object> paramMap)throws Exception;

	// same member other reviews
	public List<ReviewVO> getSameWriterOtherReviews(int member_no) throws Exception;
	
	// same ebook other reviews
    public List<ReviewVO> getSameBookOtherReviews(int ebook_no)throws Exception;
	
}
