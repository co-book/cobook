package org.ebook.cobook.ebook.persistence;

import java.util.List;

import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVo;
import org.ebook.cobook.ebook.domain.EbookVO;

public interface EbookDAO {
	//Ebook
	public List<EbookVO> getEbookList(String category) throws Exception;
	public EbookVO eBookDetail(int ebook_no) throws Exception;
	
	//bookMark
	public List<BookmarkVO> getBookmarkList(BorrowVo vo) throws Exception;
	public void writeBookmark(BookmarkVO vo) throws Exception;
	public void deleteBookmark(BookmarkVO vo) throws Exception;
	public void setLastPage(BorrowVo vo) throws Exception;
	
	
	
	
}
