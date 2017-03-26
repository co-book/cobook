package persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.persistence.ReviewDAO;
import org.ebook.cobook.reply.persistence.ReplyDAO;
import org.junit.Ignore;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import utils.AbstractCommonConfTest;

public class BookReviewDAOTest extends AbstractCommonConfTest{

	@Inject
	private ReviewDAO dao;
	
	@Inject
	private ReplyDAO replyDAO;
	
	private Logger logger = LoggerFactory.getLogger(BookReviewDAOTest.class);
	
	@Test
	@Ignore
	public void ReviewSingle() throws Exception{
		
		 Map map = dao.getReviewSingle(1);
		 System.out.println(map.toString());
	}
	
	@Test
	@Ignore
	public void ReviewCount() throws Exception{
		
	    Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("board_no",2);
		paramMap.put("parent_type","BOOKREVIEW");
		int result = replyDAO.getReplyCount(paramMap);
		System.out.println(result);
	}
	
	@Test
	@Ignore
	public void test3()throws Exception{
		
		System.out.println(dao.getlastedReviewList());
	}
	
	@Test
	public void getLikeList()throws Exception{
		
		
	}
	
	
}
