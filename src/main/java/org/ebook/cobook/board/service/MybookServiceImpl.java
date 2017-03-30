package org.ebook.cobook.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;
import org.ebook.cobook.board.persistence.MybookDAO;
import org.ebook.cobook.fileUpload.domain.FilesVO;
import org.ebook.cobook.fileUpload.persistence.FilesDAO;
import org.ebook.cobook.mypage.persistence.MyPageDAO;
import org.springframework.stereotype.Service;


@Service
public class MybookServiceImpl implements MybookService {

	@Inject
	private MybookDAO mybookDAO;

	@Inject
	private FilesDAO filesDAO;

	@Inject
	private MyPageDAO myPageDAO;
	
	@Override
	public List<Map<String, Object>> getMybookList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mybookDAO.getMybookList(cri);
	}

	@Override
	public int getCriCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mybookDAO.getCriCount(cri);
	}

	@Override
	public Map<String, Object> getMybookSingle(Integer mybook_no) throws Exception {
		// TODO Auto-generated method stub
		mybookDAO.increseHit(mybook_no);

		return mybookDAO.getMybookSingle(mybook_no);
	}

	@Override
	public void writeMybook(MybookVO mybookVO, FilesVO filesVO) throws Exception {
		// TODO Auto-generated method stub
		// selectKey태그에 의해 review_no값을 mybookVO객체에 자동으로 셋팅된다
		mybookDAO.writeMybook(mybookVO);
		// 방금 저장한 게시물의 번호를 가져와서
		// 파일테이블에 book_no값을 넣어줘야함
		filesVO.setBook_no(mybookVO.getMybook_no());
		filesVO.setBook_type("MYBOOK");

		// 커버 파일 따로등록
		filesDAO.insertCoverFile(filesVO);
		// 파일등록 여부를 검사
		String[] files = filesVO.getFiles();
		if (files == null) {
			return;
		}
		// 다중 파일등록
		filesDAO.multiFile(files, filesVO);
	}

	@Override
	public void modifyMybook(MybookVO mybookVO, FilesVO filesVO) throws Exception {
		// TODO Auto-generated method stub
		filesDAO.deleteFile(filesVO);

		mybookDAO.modifyMybook(mybookVO);
		// 파일등록 여부를 검사
		String[] files = filesVO.getFiles();
		if (files == null) {
			return;
		}
		System.out.println("serviceImpl: " + filesVO.toString());
		// 다중 파일등록
		filesDAO.multiFile(files, filesVO);
	}

	@Override
	public void deleteMybook(Integer mybook_no, FilesVO filesVO) throws Exception {
		// TODO Auto-generated method stub
		// 게시물을 삭제하기전에 참조관계인 파일목록을 제거
		filesDAO.deleteFile(filesVO);
		mybookDAO.deleteMybook(mybook_no);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return filesDAO.getAttach(bno);
	}

	@Override
	public List<Map<String, Object>> getUserMybookList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.getUserMybookList(paramMap);
	}
	
	

}
