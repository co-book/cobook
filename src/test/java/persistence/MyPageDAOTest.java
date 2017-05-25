package persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.mypage.persistence.MyPageDAO;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import utils.AbstractCommonConfTest;

public class MyPageDAOTest extends AbstractCommonConfTest{

	private Logger logger = LoggerFactory.getLogger(MyPageDAOTest.class);
	
	@Inject
	private MyPageDAO dao;
	
	@Test
	public void myBookReviewList() throws Exception{
		/*
		List<Map<String, Object>> list = dao.getMyBookReviewList(2);
		for(Map<String, Object> map : list){
			
			logger.debug(map.toString());
			
		}*/
		
		
	}
	
	
}
