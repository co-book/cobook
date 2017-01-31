package org.ebook.cobook.ebook.service;

import java.util.List;

import org.ebook.cobook.ebook.domain.EbookVO;
import org.springframework.ui.Model;

public interface EbookService {

	public List<EbookVO> getEbookList(Model model)throws Exception;
	
}
