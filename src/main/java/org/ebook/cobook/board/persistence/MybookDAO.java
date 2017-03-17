package org.ebook.cobook.board.persistence;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;

public interface MybookDAO {

	// mybook리스트 가져오기
	public List<Map<String, Object>> getMybookList(Criteria cri)throws Exception;
	
	public int getCriCount(Criteria cri)throws Exception;
	
	public Map<String, Object> getMybookSingle(Integer mybook_no)throws Exception;
	
	public void writeMybook(MybookVO mybookVO)throws Exception;
	
	public void modifyMybook(MybookVO mybookVO)throws Exception;
	
	public void deleteMybook(Integer mybook_no)throws Exception;
	
	public void increseHit(Integer mybook_no)throws Exception;
	
	public List<MybookVO> listAll()throws Exception;
	
	
	
}
