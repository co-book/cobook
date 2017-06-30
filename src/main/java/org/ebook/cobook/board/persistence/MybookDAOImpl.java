package org.ebook.cobook.board.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.domain.MybookVO;
import org.springframework.stereotype.Repository;

@Repository
public class MybookDAOImpl implements MybookDAO {

	@Inject
	private SqlSession session;
	
	private final String namespace = "org.ebook.cobook.mapper.MybookMapper";
	
	@Override
	public int getCriCount(Criteria cri) throws Exception{
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getCriCount", cri);
	}

	@Override
	public Map<String, Object> getMybookSingle(Integer mybook_no) throws Exception{
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getMybookSingle", mybook_no);
	}

	@Override
	public void writeMybook(MybookVO mybookVO) throws Exception{
		// TODO Auto-generated method stub
		session.insert(namespace+".insert", mybookVO);
	}

	@Override
	public void modifyMybook(MybookVO mybookVO) throws Exception{
		// TODO Auto-generated method stub
		session.update(namespace+".update", mybookVO);
	}

	@Override
	public void deleteMybook(Integer mybook_no) throws Exception{
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", mybook_no);
	}

	@Override
	public void increseHit(Integer mybook_no) throws Exception{
		// TODO Auto-generated method stub
		session.update(namespace+".increseHit", mybook_no);
	}

	@Override
	public List<MybookVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}

	/*@Override
	public List<Map<String, Object>> getMybookList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getMybookList", cri);
	}
*/
	@Override
	public List<MybookVO> getMybookAllList(String con, MybookVO vo) throws Exception {
		// TODO Auto-generated method stub
		int offset = 0;
		if(vo.getMoreCnt()==1)
		{
			offset = 0;
		}else{
			offset = vo.limit*(vo.getMoreCnt()-1);//0;	//어디서부터 뽑아올 것인가
		}
		System.out.println("vo.limit"+vo.limit);
		System.out.println("vo.getMoreCnt()"+vo.getMoreCnt());
		
		int limit=(vo.limit*vo.getMoreCnt());
		RowBounds rowBounds = new RowBounds(offset,limit);	//mybatis에서 offset 부터 limit까지 뽑아오는..?

		System.out.println("offset"+offset);
		System.out.println("limit"+limit);
		
		
		return session.selectList(namespace+".getAllMybookList", con,rowBounds);
	}

	@Override
	public int getMybookAllCount(String con) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getMybookCount", con);
	}

	
	
}
