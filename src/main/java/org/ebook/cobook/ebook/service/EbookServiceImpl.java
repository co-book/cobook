package org.ebook.cobook.ebook.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.ebook.persistence.EbookDAO;
import org.ebook.cobook.mypage.persistence.MyPageDAO;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class EbookServiceImpl implements EbookService {

	@Inject
	private EbookDAO ebookDAO;
	
	@Inject
	private MyPageDAO myPageDAO;	
	
	@Override
	public List<EbookVO> getEbookList(String category) throws Exception {
		// TODO Auto-generated method stub
		return ebookDAO.getEbookList(category);
	}

	@Override
	public List<BookmarkVO> getBookmarkList(BorrowVO borrow) throws Exception {
		// TODO Auto-generated method stub
		return ebookDAO.getBookmarkList(borrow);
	}

	@Override
	public void writeBookMark(BookmarkVO bookmark) throws Exception {
		// TODO Auto-generated method stub
		ebookDAO.writeBookmark(bookmark);
	}

	@Override
	public void deleteBookmark(BookmarkVO bookmark) throws Exception {
		// TODO Auto-generated method stub
		ebookDAO.deleteBookmark(bookmark);
	}

	@Override
	public void setLastPage(BorrowVO borrowVo) throws Exception {
		// TODO Auto-generated method stub
		ebookDAO.setLastPage(borrowVo);
	}

	@Override
	public EbookVO eBookDetail(int ebookn_no) throws Exception {
		// TODO Auto-generated method stub
		return ebookDAO.eBookDetail(ebookn_no);
	}

	@Override
	public List<Map<String, Object>> getMyborrowList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.getMyborrowList(paramMap);
	}

	@Override
	public void borrowEbook(BorrowVO borrowVo) throws Exception {
		// TODO Auto-generated method stub
		ebookDAO.borrowEbook(borrowVo);
	}


}
