package org.ebook.cobook.ebook.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.ebook.domain.BookmarkVO;
import org.ebook.cobook.ebook.domain.BorrowVo;
import org.ebook.cobook.ebook.domain.EbookVO;
import org.springframework.stereotype.Repository;

@Repository
public class EbookDAOImpl implements EbookDAO {
	@Inject
	private SqlSession sqlSession;
	
	private final String ebookNamespace = "org.ebook.cobook.mapper.ebookMapper";
	

	@Override
	public List<EbookVO> getEbookList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ebookNamespace+".getEbookList" );
	}


	@Override
	public List<BookmarkVO> getBookmarkList(BorrowVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ebookNamespace+".getBookmarkList" , vo);
	}


	@Override
	public void setBookmark(BookmarkVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(ebookNamespace+".setBookmark", vo);
	}


	@Override
	public void removeBookmark(BookmarkVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(ebookNamespace+".removeBookmark", vo);
		
	}
	
	@Override
	public void updateLastPage(BorrowVo vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(ebookNamespace+".updateLastPage", vo);
		
	}

	
}