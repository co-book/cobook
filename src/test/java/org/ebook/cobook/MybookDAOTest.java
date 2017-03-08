package org.ebook.cobook;

import java.util.List;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.board.service.MybookService;
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
public class MybookDAOTest {

	@Inject
	private MybookService service;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MybookDAOTest.class);
	
	// 등록
	@Test
	@Ignore
	public void insert()throws Exception{
		
		MybookVO vo = new MybookVO();
		vo.setMember_no(2);
		vo.setTitle("제목입니다");
		vo.setContents("내용입니다");
		vo.setHit(0);
		service.register(vo);
		
	}
	
	// 읽기
	@Test
	@Ignore
	public void read()throws Exception{
		
		System.out.println(service.readPage(201).toString());
	}
	
	// 수정
	@Test
	@Ignore
	public void update()throws Exception{
		
		MybookVO vo = new MybookVO();
		vo.setTitle("제목변경");
		vo.setContents("내용 변경");
		vo.setMybook_no(201);
		service.modify(vo);
		System.out.println(service.readPage(vo.getMybook_no()));
	}
	
	// 삭제
	@Test
	@Ignore
	public void remove()throws Exception{
		
		service.remove(201);
	}

	// 조회
	@Test
	public void selectList()throws Exception{
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.getCriCount(cri));
		
		List<MybookVO> list = service.listCriPage(cri);
		int i = 1;
		for(MybookVO vo : list){
			System.out.println("[" + i +"]"+vo.toString());
			i++;
		}
	}
	
}
