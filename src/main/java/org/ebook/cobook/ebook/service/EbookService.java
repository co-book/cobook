package org.ebook.cobook.ebook.service;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVo;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.springframework.ui.Model;

public interface EbookService {

	public List<EbookVO> getEbookList(String category)throws Exception;
	
	public EbookVO eBookDetail(int ebookn_no) throws Exception;
	
	public List<BookmarkVO> getBookmarkList(BorrowVo borrow)throws Exception;
	
	public void writeBookMark(BookmarkVO bookmark) throws Exception;
	
	public void deleteBookmark(BookmarkVO bookmark) throws Exception;

	void setLastPage(BorrowVo borrowVo) throws Exception;
	
	// 내가 빌린 책 리스트
	public List<Map<String, Object>> getMyborrowList(Map<String, Object> paramMap)throws Exception;

}
