package persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.reply.domain.ReplyVO;
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
		
		Map map = new HashMap();
		map.put("board_no", 2);
		map.put("parent_type", "BOOKREVIEW");
		logger.debug(dao.replyList(map).toString());
	}
	
	@Test
	public void getLikeList() throws Exception{
		
		ReplyVO vo = new ReplyVO();
		vo.setParent_type("BOOKREVIEW");
		vo.setBoard_no(2);
		vo.setMember_no(1);
		logger.debug(dao.getLikeList(vo).toString());
	}
	
	
}
