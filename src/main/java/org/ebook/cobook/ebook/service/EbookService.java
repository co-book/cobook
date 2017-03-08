package org.ebook.cobook.ebook.service;

import java.util.List;

import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVo;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.springframework.ui.Model;

public interface EbookService {

	public List<EbookVO> getEbookList(Model model)throws Exception;
	
	public List<BookmarkVO> getBookmarkList(BorrowVo borrow)throws Exception;
	
	public void setBookMark(BookmarkVO bookmark) throws Exception;
	
	public void removeBookmark(BookmarkVO bookmark) throws Exception;

	void updateLastPage(BorrowVo borrowVo) throws Exception;
	
}
