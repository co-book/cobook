package org.ebook.cobook.ebook.service;

import java.util.List;
import java.util.Map;

import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.ebook.domain.WishListVO;
import org.springframework.ui.Model;

public interface EbookService {

	public List<EbookVO> getEbookList(String category)throws Exception;
	
	public EbookVO eBookDetail(int ebookn_no ,int member_no) throws Exception;
	
	//single-이책을 대여한 사람들의 선택
	public List<EbookVO> getOtherList(EbookVO vo)throws Exception;
	
	//bookmark
	public List<BookmarkVO> getBookmarkList(BorrowVO borrow)throws Exception;
	public void writeBookMark(BookmarkVO bookmark) throws Exception;
	public void deleteBookmark(BookmarkVO bookmark) throws Exception;
	void setLastPage(BorrowVO borrowVo) throws Exception;
	
	// 내가 빌린 책 리스트
	//public List<Map<String, Object>> getMyborrowList(Map<String, Object> paramMap)throws Exception;
	
	//borrow
	public void borrowEbook(BorrowVO borrowVo) throws Exception;
	
	//add wishList
	public String addWishList(WishListVO evo) throws Exception;
	
	//main Monthly list
	public List<EbookVO> getMonthlyList() throws Exception;
	//main topic list
	public List<EbookVO> getEbookAllList() throws Exception;
}
