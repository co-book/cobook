package service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.board.service.ReviewService;
import org.junit.Ignore;
import org.junit.Test;

import utils.AbstractCommonConfTest;

public class BookReviewServiceTest extends AbstractCommonConfTest{

	@Inject
	private ReviewService service;
	
	/*@Test
	public void getReviewList() throws Exception{
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		List<ReviewVO> list = service.getBookReviewList(cri);
		
		for(ReviewVO vo : list){
			System.out.println(vo.toString());
		}
		
		
	}
	*/
	@Test
	@Ignore
	public void T()throws Exception{
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		List<Map<String, Object>> list = service.getReviewPopularity(cri);
		for(Map<String, Object> map : list){
			System.out.println(map.toString());
		}
		
		
	}
	
	@Test
	public void h() throws Exception{
		List<ReviewVO> list = service.getlastedReviewList();
		for(ReviewVO vo : list){
			System.out.println(vo.toString());
		}
	}
	
	@Test
	public void getReviewSingle() throws Exception{
		
		Map map = service.getReviewSingle(1);
		System.out.println(map.toString());
	}
	
	@Test
	@Ignore
	public void getBestReply()throws Exception{
		List<Map<String, Object>> list = service.getBestReply();
		for(Map paramMap : list){
			System.out.println(paramMap.toString());
		}
	}
	
	
}
