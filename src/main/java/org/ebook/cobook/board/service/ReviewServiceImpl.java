package org.ebook.cobook.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.board.persistence.ReviewDAO;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.ebook.cobook.fileUpload.persistence.FilesDAO;
import org.ebook.cobook.mypage.persistence.MyPageDAO;
import org.ebook.cobook.reply.domain.ReplyVO;
import org.ebook.cobook.reply.persistence.ReplyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO reviewDAO;
	
	@Inject
	private ReplyDAO replyDAO;
	
	@Inject
	private FilesDAO filesDAO;
	
	@Inject
	private MyPageDAO myPageDAO;

	// 회원의 대출목록을 가져오는 함수
	@Override
	public List<Map<String, Object>> borrowBookList(Integer member_no) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getBorrowedBook(member_no);
	}

	// 리뷰게시물 등록과 파일등록을 수행 하는 함수
	@Override
	public void writeReview(ReviewVO reviewVO, FilesVO filesVO) throws Exception {
		// TODO Auto-generated method stub
		// selectKey태그에 의해 review_no값을 ReviewVO객체에 자동으로 셋팅된다
		reviewDAO.writeReview(reviewVO);
		// 방금 저장한 게시물의 번호를 가져와서 
		// 파일테이블에 book_no값을 넣어줘야함
		filesVO.setBook_no(reviewVO.getReview_no());
		filesVO.setBook_type("BOOKREVIEW");
		
		String[] files = filesVO.getFiles();
		if(files == null){return;}
		
		filesDAO.multiFile(files, filesVO);
	}
	
	// 리뷰게시판에 뿌려줄 게시물목록
	@Override
	public List<Map<String, Object>> getBookReviewList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getBookReviewList(cri);
	}

	// 페이징 처리를 위한 전체 게시물 갯수를 리턴
	@Override
	public int getBookReviewCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getReviewCount(cri);
	}

	// 특정 게시물 읽어오기
	@Override
	public Map<String, Object> getReviewSingle(Integer review_no) throws Exception {
		// TODO Auto-generated method stub
		
		reviewDAO.increseHit(review_no);
		return reviewDAO.getReviewSingle(review_no);
	}

	// 게시물 수정
	@Override
	public void modifyBookReview(ReviewVO reviewVO, FilesVO filesVO) throws Exception {
		// TODO Auto-generated method stub
	
		// 기존에 등록된 파일과 사용자가 수정한 파일을 비교해서 db에
		// 등록할경우 로직이 더추가 되기때문에 간결하게 하기위해서 파일을 일괄삭제
		filesDAO.deleteFile(filesVO);
		// 삭제한후 수정된 게시물 등록 & 파일 재등록
		reviewDAO.modifyReview(reviewVO);
		// 회원이 파일을 등록햇는지 검사
		String[] files = filesVO.getFiles();
		if(files == null){return;}
		
		filesDAO.multiFile(files, filesVO);
	}

	// 게시물 삭제
	@Override
	public void deleteReview(Integer review_no, FilesVO filesVO) throws Exception {
		// TODO Auto-generated method stub
	// 리뷰게시물을 삭제하기전에 참조관계인 파일목록을 지워야한다
		filesDAO.deleteFile(filesVO);
		reviewDAO.deleteReview(review_no);
	}

	// 인기순 리뷰 리스트
	@Override
	public List<Map<String, Object>> getReviewPopularity(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getReviewPopularity(cri);
	}

	// 해당 리뷰 게시물의 총 댓글수
	@Override
	public int getReplyCount(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("board_no", vo.getBoard_no());
		paramMap.put("parent_type", vo.getParent_type());
		
		return replyDAO.getReplyCount(paramMap);
	}

	// 최근 리뷰 리스트
	@Override
	public List<ReviewVO> getlastedReviewList() throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getlastedReviewList();
	}
	
	// 베댓
		@Override
		public List<Map<String, Object>> getBestReply() {
			// TODO Auto-generated method stub
			return reviewDAO.getBestReply();
		}

		@Override
		public List<Map<String, Object>> getMyBookReviewList(Map<String, Object> paramMap) throws Exception {
			// TODO Auto-generated method stub
			return myPageDAO.getMyBookReviewList(paramMap);
		}
		
		// 같은 회원 다른 리뷰
		@Override
		public List<ReviewVO> getSameWriterOtherReviews(int member_no) throws Exception {
			// TODO Auto-generated method stub
			return reviewDAO.getSameWriterOtherReviews(member_no);
		}

		@Override
		public List<ReviewVO> getSameBookOtherReviews(int ebook_no) throws Exception {
			// TODO Auto-generated method stub
			return reviewDAO.getSameBookOtherReviews(ebook_no);
		}
	
	
}
