package org.ebook.cobook.board.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final String borrowNamespace = "org.ebook.cobook.mapper.BorrowedBookMapper";
	private final String reviewNamespace = "org.ebook.cobook.mapper.ReviewMapper";
	
	
	@Override
	public List<Map<String, Object>> getBorrowedBook(Integer member_no)throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList(borrowNamespace+".bollowBookList", member_no);
	}


	@Override
	public void writeReview(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(reviewNamespace+".writeReview", vo);
	}


	@Override
	public List<Map<String, Object>> getBookReviewList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(reviewNamespace+".getBookReviewList", cri);
	}


	@Override
	public int getReviewCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(reviewNamespace+".getReviewCount", cri);
	}


	@Override
	public Map<String, Object> getReviewSingle(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(reviewNamespace+".getReviewSingle", review_no);
	}


	@Override
	public void modifyReview(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(reviewNamespace+".modifyReview", vo);
	}


	@Override
	public void deleteReview(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(reviewNamespace+".deleteReview", review_no);
	}


	@Override
	public void increseHit(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(reviewNamespace+".increseHit", review_no);
	}


	@Override
	public List<Map<String, Object>> getReviewPopularity(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(reviewNamespace+".getReviewPopularity", cri);
	}

// 최근 리뷰
	@Override
	public List<ReviewVO> getlastedReviewList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(reviewNamespace+".getlastedReviewList");
	}

// 베댓
	@Override
	public List<Map<String, Object>> getBestReply() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(reviewNamespace+".getBestReply");
	}

    // same writer other reviews
	@Override
	public List<ReviewVO> getSameWriterOtherReviews(int member_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(reviewNamespace+".getSameWriterOtherReviews", member_no);
	}

	// same ebook other reviews
		public List<ReviewVO> getSameBookOtherReviews(int ebook_no)throws Exception{
		
			return sqlSession.selectList(reviewNamespace+".getSameBookOtherReviews", ebook_no);
		};
	
	
}
