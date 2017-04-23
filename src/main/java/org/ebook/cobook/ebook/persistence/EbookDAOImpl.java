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
	public List<EbookVO> getEbookList(String category) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ebookNamespace+".getEbookList" , category);
	}


	@Override
	public List<BookmarkVO> getBookmarkList(BorrowVo vo) throws Exception {
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
	public void setLastPage(BorrowVo vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(ebookNamespace+".updateLastPage", vo);
		
	}


	@Override
	public EbookVO eBookDetail(int ebook_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ebookNamespace+".eBookDetail", ebook_no);
	}

	
}
