package service;

import java.util.List;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.board.service.ReviewService;
import org.junit.Test;

import utils.AbstractCommonConfTest;

public class BookReviewServiceTest extends AbstractCommonConfTest{

	@Inject
	private ReviewService service;
	
	@Test
	public void getReviewList() throws Exception{
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		List<ReviewVO> list = service.getBookReviewList(cri);
		
		for(ReviewVO vo : list){
			System.out.println(vo.toString());
		}
		
		
	}
	
	
	
	
	
}
