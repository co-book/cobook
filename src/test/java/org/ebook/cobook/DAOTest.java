package org.ebook.cobook;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.board.persistence.ReviewDAO;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DAOTest {

	@Inject
	private ReviewDAO dao;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(DAOTest.class);

	
	@Test
	@Ignore
	public void listTest() throws Exception{
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		cri.setKeyword("TITLE");
		cri.setSearchType("t");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.getCount(cri));
		
		List<ReviewVO> list = dao.bookReviewList(cri);
		logger.info(list.toString());
		logger.info(pageMaker.toString());
		logger.info(pageMaker.makeSearch(1));
		
	}
	
	@Test
	@Ignore
	public void read()throws Exception{
		
		Map<String, Object> map = dao.readBookReview(103);
		logger.debug("debug: "+map.toString());
		logger.info("info: "+map.toString());
	}
	
	@Test
	@Ignore
	public void update() throws Exception{
		
		ReviewVO vo = new ReviewVO();
		vo.setTitle("제목");
		vo.setContents("내용");
		vo.setReview_no(101);
		vo.setEbook_no(5);
		
		dao.updateBookReview(vo);
	}
	
	@Test
	@Ignore
	public void delete()throws Exception{
		
		dao.deleteBookReview(99);
		
		
	}
}
