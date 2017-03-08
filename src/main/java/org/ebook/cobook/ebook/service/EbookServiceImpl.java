package org.ebook.cobook.ebook.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVo;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.ebook.persistence.EbookDAO;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class EbookServiceImpl implements EbookService {

	@Inject
	private EbookDAO ebookDAO;
	
	@Override
	public List<EbookVO> getEbookList(Model model) throws Exception {
		// TODO Auto-generated method stub
		return ebookDAO.getEbookList();
	}

	@Override
	public List<BookmarkVO> getBookmarkList(BorrowVo borrow) throws Exception {
		// TODO Auto-generated method stub
		return ebookDAO.getBookmarkList(borrow);
	}

	@Override
	public void setBookMark(BookmarkVO bookmark) throws Exception {
		// TODO Auto-generated method stub
		ebookDAO.setBookmark(bookmark);
	}

	@Override
	public void removeBookmark(BookmarkVO bookmark) throws Exception {
		// TODO Auto-generated method stub
		ebookDAO.removeBookmark(bookmark);
	}

	@Override
	public void updateLastPage(BorrowVo borrowVo) throws Exception {
		// TODO Auto-generated method stub
		ebookDAO.updateLastPage(borrowVo);
	}


}
