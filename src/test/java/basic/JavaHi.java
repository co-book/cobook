package basic;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.ebook.cobook.board.domain.Criteria;
import org.ebook.cobook.board.persistence.MybookDAO;
import org.junit.Ignore;
import org.junit.Test;

import utils.AbstractCommonConfTest;

public class JavaHi extends AbstractCommonConfTest{

	@Inject
	private MybookDAO dao;
	
	@Ignore
	@Test
	public void gugudan() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		List<Map<String, Object>> list = dao.getMybookList(cri);
		int size = list.size();
		System.out.println("list size: " + list.size());
		int sizeValue = size % 2 == 1? size / 2 + 1: size / 2;
		String topHtml = "<div class='wthree-news-top-left'>";
		String topHtml2 = "</div>";
		String aopHtml = "<div class='col-md-6 w3-agileits-news-left'>";
		for(int i = 0; i < sizeValue; i++){
			System.out.println(topHtml);
			for(int j = 0; j < size; j++){
				System.out.println("i +" + i);
				System.out.println("j +" + j);
				
				System.out.println(aopHtml);
				System.out.println(list.get(j));
				System.out.println(topHtml2);
				if(j / 2 == 0){break;}
			}
			System.out.println(topHtml2);
			
		}
				
	}
	
	@Test
	public void a(){
		
		for(int i = 0; i < 10; i++){
			
			for(int j = 0; j < 10; j++){
				System.out.println("i :" + i);
				System.out.println("j :" + j);
				if(j == 3){
					continue;
				}
			}
			
		}
		
		
		
		
		
		
	}
	
}
