package org.ebook.cobook.ebook.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public class ebookServiceImpl implements ebookService {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String ebookNo = request.getParameter("");
		
		

	}

}
