package org.ebook.cobook.board.persistence;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;

public interface MybookDAO {

	public List<Map<String, Object>> listCri(Criteria cri)throws Exception;
	
	public int getCriCount(Criteria cri)throws Exception;
	
	public MybookVO read(Integer mybook_no)throws Exception;
	
	public void insert(MybookVO mybookVO)throws Exception;
	
	public void update(MybookVO mybookVO)throws Exception;
	
	public void delete(Integer mybook_no)throws Exception;
	
	public void increseHit(Integer mybook_no)throws Exception;
	
}
