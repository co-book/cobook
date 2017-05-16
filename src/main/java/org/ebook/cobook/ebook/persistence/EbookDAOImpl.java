package org.ebook.cobook.ebook.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVO;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.ebook.domain.WishListVO;
import org.springframework.stereotype.Repository;

@Repository
public class EbookDAOImpl implements EbookDAO {
	@Inject
	private SqlSession sqlSession;
	
	private final String ebookNamespace = "org.ebook.cobook.mapper.ebookMapper";
	private final String mainNamespace = "org.ebook.cobook.mapper.mainMapper";
	

	@Override
	public List<EbookVO> getEbookList(String category) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ebookNamespace+".getEbookList" , category);
	}
	
	@Override
	public List<EbookVO> getOtherList(EbookVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ebookNamespace+".getOtherList" , vo);
	}

	@Override
	public List<BookmarkVO> getBookmarkList(BorrowVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ebookNamespace+".getBookmarkList" , vo);
	}


	@Override
	public void writeBookmark(BookmarkVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(ebookNamespace+".setBookmark", vo);
	}


	@Override
	public void deleteBookmark(BookmarkVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(ebookNamespace+".removeBookmark", vo);
		
	}
	
	@Override
	public void setLastPage(BorrowVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(ebookNamespace+".updateLastPage", vo);
		
	}


	@Override
	public EbookVO eBookDetail(int ebook_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ebookNamespace+".getEbookDetail", ebook_no);
	}


	@Override
	public void borrowEbook(BorrowVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(ebookNamespace+".borrowEbook", vo);
	}


	@Override
	public float getMemberBorrow(BorrowVO bvo) throws Exception {
		// TODO Auto-generated method stub
		Object result = sqlSession.selectOne(ebookNamespace+".getMemberBorrow", bvo);
		float resultFloat;
		if(result==null){
			resultFloat=-9999;
		}else{
			resultFloat=(float)result;
		}
		return resultFloat;
	}


	@Override
	public void addWishList(WishListVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(ebookNamespace+".addWishList", vo);
	}


	@Override
	public WishListVO wishListCheck(WishListVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ebookNamespace+".wishListCheck", vo);
	}


	@Override
	public List<EbookVO> getMonthlyList() throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(mainNamespace+".getMonthlyList");
	}

	@Override
	public List<EbookVO> getEbookAllList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mainNamespace+".getEbookAllList");
	}

	
}
