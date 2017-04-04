package service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;
import org.ebook.cobook.board.domain.PageMaker;
import org.ebook.cobook.board.service.MybookService;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.junit.Ignore;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import utils.AbstractCommonConfTest;

public class MybookServiceTest extends AbstractCommonConfTest{

	@Inject
	private MybookService service;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MybookServiceTest.class);

	// mybook-register
	@Test
	@Ignore
	public void create() throws Exception{
		
		MybookVO mybookVO = new MybookVO();
		FilesVO filesVO = new FilesVO();
		mybookVO.setMember_no(2);
		mybookVO.setTitle("제목001");
		mybookVO.setContents("내용001");
		
		
		String[] files = {"/2016/2/3/c9d0b78e-e5c7-4a99-be02-63b87a8becf1_댓글 보이기.PNG", "b3b03fda-9b64-446f-912b-a647da2eb2e8_발사믹.PNG"
				, "acc35670-5e4c-4fcc-bf11-523db48d9fda_댓글 보이기.PNG"};
	
		filesVO.setFiles(files);
		//service.register(mybookVO, filesVO);
	}
	
	// mybook - read
	@Test
	public void read() throws Exception{
		
		Integer mybook_no = 2;
		service.getMybookSingle(mybook_no).toString();
	}
	
	@Test
	@Ignore
	public void TestCriList() throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		Criteria cri = new Criteria();
		cri.setKeyword("TITLE 090");
		cri.setSearchType("t");
		cri.setPage(1);
		cri.setPerPageNum(10);
		List<Map<String, Object>> list = service.getMybookList(cri);
		for(Map vo : list){
			System.out.println(vo.toString());
		}
		
	}
	
	
}
