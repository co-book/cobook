package org.ebook.cobook.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.board.persistence.ReviewDAO;
import org.ebook.cobook.fileUpload.persistence.FilesDAO;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO reviewDAO;
	
	@Inject
	private FilesDAO filesDAO;

	@Override
	public List<Map<String, Object>> borrowBookList(Integer member_no) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getBorrowedBook(member_no);
	}

	@Override
	public void writeReview(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.create(vo);
	}
	
	@Override
	public List<ReviewVO> getBookReviewList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.bookReviewList(cri);
	}

	@Override
	public int getBookReviewCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getCount(cri);
	}

	@Override
	public Map<String, Object> readBookReview(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		
		reviewDAO.increseHit(review_no);
		return reviewDAO.readBookReview(review_no);
	}

	@Override
	public void modifyBookReview(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.updateBookReview(vo);
	}

	@Override
	public void removeBookReview(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.deleteBookReview(review_no);
	}
	
}
