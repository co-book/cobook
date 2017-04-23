package org.ebook.cobook.ebook.persistence;

import java.util.List;

import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;

public interface EbookDAO {
	//Ebook
	public List<EbookVO> getEbookList(String category) throws Exception;
	public EbookVO eBookDetail(int ebookn_no) throws Exception;
	
	//bookMark
	public List<BookmarkVO> getBookmarkList(BorrowVO vo) throws Exception;
	public void writeBookmark(BookmarkVO vo) throws Exception;
	public void deleteBookmark(BookmarkVO vo) throws Exception;
	public void setLastPage(BorrowVO vo) throws Exception;
	
	
	//borrow
	public void borrowEbook(BorrowVO vo) throws Exception;
	
	
	
}
