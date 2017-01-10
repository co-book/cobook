package org.ebook.cobook.fileUpload.persistence;

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
	public void deleteFile(Integer file_no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".deleteFile", file_no);
	}

	
	
	
	
}
