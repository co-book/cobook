package org.ebook.cobook.fileUpload.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.springframework.stereotype.Repository;

@Repository
public class FilesDAOImpl implements FilesDAO {

	@Inject
	private SqlSession session;
	
	private final String namespace = "org.ebook.cobook.mapper.FilesMapper";
	
	@Override
	public void insertFile(FilesVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insertFile", vo);
	}

	@Override
	public void deleteFile(FilesVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".deleteFile", vo);
	}

	@Override
	public void multiFile(String[] files, FilesVO filesVO) throws Exception {

		
		// 파일 url, name, 확장자를 구해야함
		for(String fileFullName : files){
			filesVO.parsingFileData(fileFullName);
			insertFile(filesVO);
		}
	}

	
	
	
	
}
