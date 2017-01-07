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
	public void create(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(reviewNamespace+".create", vo);
	}

	@Override
	public List<ReviewVO> bookReviewList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(reviewNamespace+".bookReviewList", cri);
	}

	@Override
	public int getCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(reviewNamespace+".boardReviewCount", cri);
	}

	@Override
	public Map<String, Object> readBookReview(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(reviewNamespace+".readBookReview", review_no);
	}

	@Override
	public void updateBookReview(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(reviewNamespace+".updateBookReview", vo);
	}

	@Override
	public void deleteBookReview(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(reviewNamespace+".deleteBookReview", review_no);
	}

	@Override
	public void increseHit(Integer review_no) throws Exception{
		// TODO Auto-generated method stub
		sqlSession.update(reviewNamespace+".increseHit", review_no);
	}
	
	
}
