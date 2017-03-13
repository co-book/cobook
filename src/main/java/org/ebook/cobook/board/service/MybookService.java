package org.ebook.cobook.board.service;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;
import org.ebook.cobook.fileUpload.domain.FilesVO;

public interface MybookService {

	public List<Map<String, Object>> listCriPage(Criteria cri) throws Exception;

	public int getCriCount(Criteria cri)throws Exception;

	public MybookVO readPage(Integer mybook_no)throws Exception;

	public void register(MybookVO mybookVO, FilesVO filesVO)throws Exception;

	public void modify(MybookVO mybookVO, FilesVO filesVO)throws Exception;

	public void remove(Integer mybook_no, FilesVO filesVO)throws Exception;

	
	
}
