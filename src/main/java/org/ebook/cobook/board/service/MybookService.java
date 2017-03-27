package org.ebook.cobook.board.service;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;
import org.ebook.cobook.fileUpload.domain.FilesVO;

public interface MybookService {

	// 마이북 페이지에 리스트
	public List<Map<String, Object>> getMybookList(Criteria cri) throws Exception;

	public int getCriCount(Criteria cri)throws Exception;

	public Map<String, Object> getMybookSingle(Integer mybook_no)throws Exception;

	public void writeMybook(MybookVO mybookVO, FilesVO filesVO)throws Exception;

	public void modifyMybook(MybookVO mybookVO, FilesVO filesVO)throws Exception;

	public void deleteMybook(Integer mybook_no, FilesVO filesVO)throws Exception;

	 public List<String> getAttach(Integer bno)throws Exception;
	
	 // 내가 작성한 마이북 리스트
	 public List<Map<String, Object>> getUserMybookList(Map<String, Object> paramMap)throws Exception;

}
