package persistence;

import javax.inject.Inject;

import org.ebook.cobook.reply.persistence.ReplyDAO;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import utils.AbstractCommonConfTest;

public class ReplyDaoTest extends AbstractCommonConfTest{

	@Inject
	private ReplyDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(ReplyDaoTest.class);
	
	@Test
	public void replyList(){
		
		
	}
	
	
}
