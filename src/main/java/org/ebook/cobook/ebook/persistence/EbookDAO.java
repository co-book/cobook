package org.ebook.cobook.ebook.persistence;

import java.util.List;

import org.ebook.cobook.ebook.domain.EbookVO;

public interface EbookDAO {

	public List<EbookVO> getEbookList() throws Exception;
}
