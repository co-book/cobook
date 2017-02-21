package org.ebook.cobook.ebook.persistence;

import java.util.List;

import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVo;
import org.ebook.cobook.ebook.domain.EbookVO;

public interface EbookDAO {

	public List<EbookVO> getEbookList() throws Exception;
	
	public List<BookmarkVO> getBookmarkList(BorrowVo vo) throws Exception;
	
	public void setBookmark(BookmarkVO vo) throws Exception;
	
	public void removeBookmark(BookmarkVO vo) throws Exception;

	public void updateLastPage(BorrowVo vo) throws Exception;
	

}
