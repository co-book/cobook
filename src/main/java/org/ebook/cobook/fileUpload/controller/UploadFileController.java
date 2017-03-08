package org.ebook.cobook.fileUpload.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.ebook.cobook.util.Incoding;
import org.ebook.cobook.util.MediaUtils;
import org.ebook.cobook.util.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping(value="/files/*")
public class UploadFileController {

private static final Logger logger = LoggerFactory.getLogger(UploadFileController.class);
	
	private String uploadPath = "C:\\workspace\\CoBook\\src\\main\\webapp\\resources\\summernote_upload";
	
	@ResponseBody
	//"text/plain;charset=UTF-8 > 한국어를 정상적으로 전달하기 위함.
	//이미지를 저장하기 위해서 사용되는 메서드
	@RequestMapping(value="/uploadFile", method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadForm(MultipartFile file)throws Exception{
		ResponseEntity<String> entity;
		
		logger.info("원본파일이름 : " + file.getOriginalFilename());
		logger.info("파일사이즈 : " + file.getSize());
		logger.info("파일contentType : " + file.getContentType());
		
		String uploadedName = UploadFileUtils.uploadEditorFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		
		logger.info("uploadedName : " + uploadedName);
		
		try{		
			//http://localhost:8080을 본인의 서버port에 맞게 설정하시면 됩니다.
			entity = new ResponseEntity<String>("http://localhost:8080/files/displayFile?fileName="+uploadedName,HttpStatus.CREATED);
		}catch(Exception e){
			logger.info("파일업로드 도중 에러발생: " + e.getMessage());
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return  entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		//Incoding.incoding(fileName);
		/*System.out.println("iso-8859-1 -> utf-8         : " + new String(fileName.getBytes("iso-8859-1"), "utf-8"));
		fileName = new String(fileName.getBytes("iso-8859-1"), "utf-8");*/
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		//fileName = fileName.replaceAll(":", "/");

		logger.info("display FILE NAME: " + fileName);

		try {
			
			//파일 확장자를 찾는다.
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			logger.info("FORMAT NAME: " + formatName);
			
			//이미지타입일 경우 적절한 타입을 맞춰준다.
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			//실제 위치에서 파일을 찾아서 삽입한다.
			in = new FileInputStream(uploadPath + fileName);
			logger.info("FILE FULL NAME : " + uploadPath + fileName);
			
			if (mType != null) {
				headers.setContentType(mType);
			} else {

				fileName = fileName.substring(fileName.indexOf("_") + 1);
				//이미지가 아닐경우에는 MIME타입을 다운로드 용으로 설정
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			
			//byte[] 데이터가 그대로 전송된다.
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName){
		ResponseEntity<String> entity;
		logger.info("filename : " + fileName);
		
		//넘어온 파일이름에 대해서 "/" -> "\"로 변경
		fileName.replace('/', File.separatorChar);
		
		//http://localhost:8080/displayEditorFile?fileName=[/2016/09/19/64d41412-d3ca-43b0-84cb-49fa25b2c603_test.png]
		String originalFileName = fileName.substring(fileName.indexOf("=")+1);
		logger.info("파일삭제filename : " + originalFileName);
		
		new File(uploadPath + originalFileName).delete();
		
		try{
			entity = new ResponseEntity<String>("deleted",HttpStatus.OK);
		}catch(Exception e){
			logger.info("파일 삭제도중 에러발생 : " + e.getMessage());
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
