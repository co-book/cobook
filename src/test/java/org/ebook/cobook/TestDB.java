package org.ebook.cobook;

import java.util.List;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.MybookVO;
import org.ebook.cobook.board.persistence.MybookDAO;
import org.junit.Test;

import utils.AbstractCommonConfTest;

public class TestDB extends AbstractCommonConfTest{

	@Inject
	private MybookDAO dao;
	
	@Test
	public void listAll() throws Exception{
		List<MybookVO> listAll = dao.listAll();
		
		for(MybookVO vo : listAll){
			System.out.println(vo.toString());
		}
	}
	
	
}
