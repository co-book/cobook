package org.ebook.cobook.board.persistence;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;

public interface MybookDAO {

	
	//public List<Map<String, Object>> getMybookList(Criteria cri)throws Exception;
	
	//마이북 리스트 가져오기 con = consonant 자음 입니다 명사에요;-) 까먹지 말라공..
	public List<MybookVO> getMybookAllList(String con, MybookVO vo) throws Exception;
	//마이북 갯수
	public int getMybookAllCount(String con) throws Exception;
	public void writeMybook(MybookVO mybookVO)throws Exception;
	
	
	/////////////////////////////////
	public int getCriCount(Criteria cri)throws Exception;
	public Map<String, Object> getMybookSingle(Integer mybook_no)throws Exception;
	
	
	public void modifyMybook(MybookVO mybookVO)throws Exception;
	public void deleteMybook(Integer mybook_no)throws Exception;
	
	public void increseHit(Integer mybook_no)throws Exception;
	public List<MybookVO> listAll()throws Exception;
	
	
	
}
