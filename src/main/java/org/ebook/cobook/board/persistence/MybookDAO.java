package org.ebook.cobook.board.persistence;

import java.util.List;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;

public interface MybookDAO {

	public List<MybookVO> listCri(Criteria cri)throws Exception;
	
	public int getCriCount(Criteria cri)throws Exception;
	
	public MybookVO read(Integer mybook_no)throws Exception;
	
	public void insert(MybookVO vo)throws Exception;
	
	public void update(MybookVO vo)throws Exception;
	
	public void delete(Integer mybook_no)throws Exception;
	
	public void increseHit(Integer mybook_no)throws Exception;
	
}
