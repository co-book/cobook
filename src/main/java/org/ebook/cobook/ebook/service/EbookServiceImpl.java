package org.ebook.cobook.ebook.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.ebook.cobook.ebook.domain.EbookVO;
import org.ebook.cobook.ebook.persistence.EbookDAO;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class EbookServiceImpl implements EbookService {

	@Inject
	private EbookDAO ebookDAO;
	
	@Override
	public List<EbookVO> getEbookList(Model model) throws Exception {
		// TODO Auto-generated method stub
	/*
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String ebookNo = request.getParameter("");
		*/
		return ebookDAO.getEbookList();
	}

}
