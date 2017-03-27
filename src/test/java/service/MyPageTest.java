package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.service.MybookService;
import org.ebook.cobook.board.service.ReviewService;
import org.ebook.cobook.ebook.service.EbookService;
import org.junit.Before;
import org.junit.Test;

import utils.AbstractCommonConfTest;

public class MyPageTest extends AbstractCommonConfTest{

	@Inject
	private ReviewService reviewService;
	
	@Inject
	private MybookService mybookService;
	
	@Inject
	private EbookService ebookService;
	
	Map<String, Object> paramMap = null;
	
	@Before
	public void setup(){
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		paramMap = new HashMap<>();
		paramMap.put("member_no", 2);
		paramMap.put("cri", cri);
		
		
	}
	
	@Test
	public void getreviewTest() throws Exception{
		
		List<Map<String, Object>> list = reviewService.getMyBookReviewList(paramMap);
		for(Map<String, Object> map : list){
			System.out.println(map.toString());
		}
	
	}
	
	@Test
	public void getMybookTest() throws Exception{
		
		
		List<Map<String, Object>> list = mybookService.getUserMybookList(paramMap);
		for(Map<String, Object> map : list){
			System.out.println(map.toString());
		}
	
	}
	
	@Test
	public void getEbookTest() throws Exception{
		Map<String, Object> paramMap = new HashMap<>();
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		paramMap.put("member_no", 10);
		paramMap.put("cri", cri);
		List<Map<String, Object>> list = ebookService.getMyborrowList(paramMap);
		
		for(Map<String, Object> map : list){
			System.out.println(map.toString());
		}
	
	}
	
	
}
