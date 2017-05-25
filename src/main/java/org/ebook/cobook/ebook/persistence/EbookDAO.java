package org.ebook.cobook.ebook.persistence;

import java.util.List;

import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.ebook.domain.WishListVO;

public interface EbookDAO {
	//Ebook
	public List<EbookVO> getEbookList(String category) throws Exception;
	//ebook single
	public EbookVO eBookDetail(int ebook_no) throws Exception;
	public float getMemberBorrow(BorrowVO bvo) throws Exception;
	// single - 이책대여한사람들의 선택
	public List<EbookVO> getOtherList(EbookVO vo) throws Exception;
 	
	//bookMark
	public List<BookmarkVO> getBookmarkList(BorrowVO vo) throws Exception;
	public void writeBookmark(BookmarkVO vo) throws Exception;
	public void deleteBookmark(BookmarkVO vo) throws Exception;
	public void setLastPage(BorrowVO vo) throws Exception;
	
	//borrow
	public void borrowEbook(BorrowVO vo) throws Exception;
	
	//add wishList
	public void addWishList(WishListVO vo) throws Exception;
	public WishListVO wishListCheck(WishListVO vo) throws Exception;
	
	//main list - monthlyList
	public List<EbookVO> getMonthlyList() throws Exception;
	
	//main list - topicList	int starAvg, 리뷰가많은순, 완독이 높은 순, 최신신간순...최신신간은 어떻게 알지? 리뷰가 많은건 리뷰테이블에서 ebook_no이 많은걸 찾아오면되나?
	public List<EbookVO> getEbookAllList() throws Exception;

	
}
