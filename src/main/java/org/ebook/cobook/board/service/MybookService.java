package org.ebook.cobook.board.service;

import java.util.List;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;

public interface MybookService {

	public List<MybookVO> listCriPage(Criteria cri) throws Exception;

	public int getCriCount(Criteria cri)throws Exception;

	public MybookVO readPage(Integer mybook_no)throws Exception;

	public void register(MybookVO vo)throws Exception;

	public void modify(MybookVO vo)throws Exception;

	public void remove(Integer mybook_no)throws Exception;

}
