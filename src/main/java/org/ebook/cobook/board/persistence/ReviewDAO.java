package org.ebook.cobook.board.persistence;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;

public interface ReviewDAO {

	public List<Map<String, Object>> getBorrowedBook(Integer member_no) throws Exception;

	public void create(ReviewVO vo) throws Exception;

	public List<ReviewVO> bookReviewList(Criteria cri) throws Exception;

	public int getCount(Criteria cri) throws Exception;

	public Map<String, Object> readBookReview(Integer review_no)throws Exception;
	
	public void updateBookReview(ReviewVO vo)throws Exception;
	
	public void deleteBookReview(Integer review_no)throws Exception;
	
	public void increseHit(Integer review_no) throws Exception;
	
	
	
	
	
	
	
	
	
}
