package org.ebook.cobook.board.service;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.fileUpload.domain.FilesVO;

public interface ReviewService {

	public List<Map<String, Object>> borrowBookList(Integer member_no)throws Exception;
	
	public void writeReview(ReviewVO reviewVO, FilesVO filesVO)throws Exception;
	
	public List<ReviewVO> getBookReviewList(Criteria cri) throws Exception;

	public int getBookReviewCount(Criteria cri) throws Exception;
	
	public Map<String, Object> readBookReview(Integer review_no)throws Exception;
	
	public void modifyBookReview(ReviewVO reviewVO, FilesVO filesVO)throws Exception;
	
	public void removeBookReview(Integer reviewVO, FilesVO filesVO)throws Exception;
	

}
