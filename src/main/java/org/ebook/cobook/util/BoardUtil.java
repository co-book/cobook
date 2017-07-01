package org.ebook.cobook.util;

public class BoardUtil {
	public static String RemoveHTMLTag(String changeStr){
	    if(changeStr != null && !changeStr.equals("")){
	        changeStr = changeStr.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	    }else{
	        changeStr = "";
	    }
	    return changeStr;
	}

}
