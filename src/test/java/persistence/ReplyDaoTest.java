package persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.reply.persistence.ReplyDAO;
import org.junit.Ignore;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import utils.AbstractCommonConfTest;

public class ReplyDaoTest extends AbstractCommonConfTest{

	@Inject
	private ReplyDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(ReplyDaoTest.class);
	
	@Test
	public void replyList() throws Exception{
		
		Map<String, Object> paramMap = new HashMap<>();
		Criteria cri = new Criteria();
		
		cri.setPage(1);
		cri.setPerPageNum(10);
		System.out.println("startPage : " + cri.getPageStart());
		
		paramMap.put("board_no", 2);
		paramMap.put("parent_type", "BOOKREVIEW");
		paramMap.put("cri", cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.getReplyCount(paramMap));
		logger.debug("페이지: "+cri.getPageStart());
	
		logger.debug(dao.replyList(paramMap).toString());
		logger.debug(pageMaker.toString());
	}
	
	@Test
	@Ignore
	public void getLikeList() throws Exception{
		
		Map paramMap = new HashMap();
		
		paramMap.put("BOOKREVIEW", "BOOKREVIEW");
		paramMap.put("board_no", 2);
		paramMap.put("member_no", 1);
		paramMap.put("parent_type", "BOOKREVIEW");
		logger.debug(dao.getLikeList(paramMap).toString());
	}
	
	
}
