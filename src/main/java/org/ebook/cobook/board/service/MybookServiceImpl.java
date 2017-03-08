package org.ebook.cobook.board.service;

import java.util.List;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;
import org.ebook.cobook.board.persistence.MybookDAO;
import org.springframework.stereotype.Service;

@Service
public class MybookServiceImpl implements MybookService{

	@Inject
	private MybookDAO mybookDAO;
	
	@Override
	public List<MybookVO> listCriPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mybookDAO.listCri(cri);
	}

	@Override
	public int getCriCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return mybookDAO.getCriCount(cri);
	}

	@Override
	public MybookVO readPage(Integer mybook_no) throws Exception {
		// TODO Auto-generated method stub
		mybookDAO.increseHit(mybook_no);
		
		return mybookDAO.read(mybook_no);
	}

	@Override
	public void register(MybookVO vo) throws Exception {
		// TODO Auto-generated method stub
		mybookDAO.insert(vo);
	}

	@Override
	public void modify(MybookVO vo) throws Exception {
		// TODO Auto-generated method stub
		mybookDAO.update(vo);
	}

	@Override
	public void remove(Integer mybook_no) throws Exception {
		// TODO Auto-generated method stub
		mybookDAO.delete(mybook_no);
	}

}
