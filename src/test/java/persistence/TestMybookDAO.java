package persistence;

import static org.junit.Assert.fail;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.board.domain.MybookVO;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import utils.AbstractCommonConfTest;

public class TestMybookDAO extends AbstractCommonConfTest {

	@Inject
	private SqlSession session;

	private static final Logger logger = LoggerFactory.getLogger(TestMybookDAO.class);

	private final String namespace = "org.ebook.cobook.mapper.FilesMapper";

	
		
	
	@Test
	public void insertFile(FilesVO filesVO) throws Exception {
		// TODO Auto-generated method stub
		String[] files = {"/2016/2/3/c9d0b78e-e5c7-4a99-be02-63b87a8becf1_댓글 보이기.PNG"};
		filesVO.setFiles(files);
	
		
		
		session.insert(namespace + ".insertFile", filesVO);
	}

}
