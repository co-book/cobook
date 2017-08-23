package org.ebook.cobook.board.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final String borrowNamespace = "org.ebook.cobook.mapper.BorrowedBookMapper";
	private final String reviewNamespace = "org.ebook.cobook.mapper.ReviewMapper";
	
	
	/**
	 * 선택할 EbookList 불러오기
	 */
	@Override
	public List<EbookVO> getEbookList(String search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(reviewNamespace+".getEbookList" , search);
	}
	
	/**
	 * Review 글쓰기 
	 */
	@Override
	public int register(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(reviewNamespace+".register", vo);
	}
	
	/**
	 * 리뷰 리스트
	 *  - 페이징 처리
	 */
	@Override
	public List<ReviewVO> getReviewList(String searchType ,int moreCnt) throws Exception {
		// TODO Auto-generated method stub
		int REWVIEWLIMIT = 10;						
		int offset = REWVIEWLIMIT*(moreCnt-1);			
		int limit=REWVIEWLIMIT;
		
		RowBounds rowBounds = new RowBounds(offset,limit);	//mybatis에서 offset 부터 limit까지 뽑아오는..?
		return sqlSession.selectList(reviewNamespace+".getReviewList", searchType, rowBounds);
	}

	/**
	 * 더보기 버튼을 위한 전체 리뷰 갯수
	 */
	@Override
	public int getReviewListCnt(String searchType) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(reviewNamespace+".getReviewListCnt");
	}
	
	/**
	 * 조회수 증가
	 */
	@Override
	public void readReview(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(reviewNamespace+".readReview", review_no);
	}
	
	/**
	 * 리뷰 상세페이지 보기
	 */
	@Override
	public Map<String, String> single(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(reviewNamespace+".single", review_no);
	}
	
    /**
     * 리뷰 글쓴기가 작석한 다른 리뷰정보
     */
	@Override
	public List<ReviewVO> getWriterReviews(int member_no) throws Exception {
		return sqlSession.selectList(reviewNamespace+".getWriterReviews", member_no);
	}
	
	/**
	 * 해당 EBOOK의 다른 리뷰 리스트
	 */
	public List<ReviewVO> getOtherReviews(int ebook_no)throws Exception{

		return sqlSession.selectList(reviewNamespace+".getOtherReviews", ebook_no);
	};
		
	
	/////////////////
	
	//////////////
	
	@Override
	public List<Map<String, Object>> getBorrowedBook(Integer member_no)throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList(borrowNamespace+".bollowBookList", member_no);
	}




	@Override
	public List<Map<String, Object>> getBookReviewList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(reviewNamespace+".getBookReviewList", cri);
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
	public List<ReviewVO> getLastedReviewList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(reviewNamespace+".getLastedReviewList");
	}

// 베댓
	@Override
	public List<Map<String, Object>> getBestReply() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(reviewNamespace+".getBestReply");
	}



	
	
}
