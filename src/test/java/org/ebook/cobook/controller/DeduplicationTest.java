package org.ebook.cobook.controller;

import java.util.List;

import javax.inject.Inject;

import org.ebook.cobook.MybookDAOTest;
import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.board.domain.ReviewVO;
import org.ebook.cobook.board.persistence.ReviewDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utils.AbstractCommonConfTest;
import utils.SpringTestConfig;

// SpringJUnit4ClassRunner는
// @SpringTestConfig에 적용되어 있는 어노테이션들을 스프링 테스트 클래스에 적용한다
// Test메서드를 실행할 때마다 테스트 클래스의 객체를 생성한다.
// 하지만 4classRunner는 스프링컨텍스트를 한번만 생성하게 한다
@RunWith(SpringJUnit4ClassRunner.class)
// 설정 중복 제거 2가지 방법
// 1.메타 어노테이션사용, 2. 상속을 통한 구현
@SpringTestConfig // 메타 애노테이션 사용
public class DeduplicationTest extends AbstractCommonConfTest{

	@Inject
	private ReviewDAO dao;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MybookDAOTest.class);
	
	@Test
	public void Test() throws Exception{
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		cri.setKeyword("TITLE");
		cri.setSearchType("t");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.getCount(cri));
		
		List<ReviewVO> list = dao.bookReviewList(cri);
		int i = 1;
		for(ReviewVO vo : list){
			logger.debug("[" + i +"] : " + vo.toString());
			i++;
		}
	
	}
	
	
	
}
