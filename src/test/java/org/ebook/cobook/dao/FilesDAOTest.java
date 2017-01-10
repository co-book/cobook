package org.ebook.cobook.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.ebook.cobook.fileUpload.persistence.FilesDAO;
import org.junit.Ignore;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import utils.AbstractCommonConfTest;

public class FilesDAOTest extends AbstractCommonConfTest{

	@Inject
	private SqlSession session;
	
	@Inject
	private FilesDAO dao;
	
	private final String namespace = "org.ebook.cobook.mapper.FilesMapper";
	
	private static final Logger logger = 
			LoggerFactory.getLogger(FilesDAOTest.class);
	
	@Test
	@Ignore
	public void testInsertFile() throws Exception {

		FilesVO vo = new FilesVO();
		vo.setBook_no(2);
		vo.setFilename("갑동이");
		vo.setFileurl("/2016");
		vo.setBook_type("bookreview");
		vo.setFiletype("css");
		
		dao.insertFile(vo);
	}

	@Test
	@Ignore
	public void testDeleteFile()throws Exception{
		
		dao.deleteFile(102);
	}
	
	
	
	
	
}
