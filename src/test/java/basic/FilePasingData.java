package basic;

import static org.junit.Assert.*;

import org.junit.Test;

public class FilePasingData {

	@Test
	public void test() {

		String fullnameFile = "http://localhost:8080/files/displayFile?fileName="
				+ "/2017/1/5/96e981d3-34e7-4fe2-a813-6f81889bb945_댓글 보이기.PNG";
		
		// 파일 url추출
		String fileurl = fullnameFile.substring(fullnameFile.indexOf("=") + 1);
		// 파일 이름 추출
		String filename = 
				fileurl.substring(fileurl.indexOf("_") + 1);
		String filetype = 
				fileurl.substring(fileurl.indexOf(".") + 1);
		
		System.out.println("1:"+fileurl);
		System.out.println("2:"+filename);
		System.out.println("3:"+filetype);
	}

}
