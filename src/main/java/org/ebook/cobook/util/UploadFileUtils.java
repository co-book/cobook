package org.ebook.cobook.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	//1.UUID를 이용한 고유한 값 생성
	//2.UUID와 결합한 업로드 파일 이름 생성
	//3.파일이 저장될 '/년/월/일' 정보 생성
	//4.업로드 기본 경로(uploadPath)와 '/년/월/일' 폴더 생성
	//5.기본경로 + 파일경로 + 파일이름으로 파일 저장
	public static String uploadEditorFile(String uploadPath, String originalName, byte[] fileData) throws Exception {

		//파일의 중복된 이름을 피하기 위해 생성
		UUID uid = UUID.randomUUID();
		//128bit+'_'+파일명
		String savedName = uid.toString() + "_" + originalName;
		//'uploadPath + 2016/06/10'형태의 파일명
		String savedPath = calcPath(uploadPath).replace(File.separator, "/");
		//실저장path + 날자형식 , 파일명
		File target = new File(uploadPath + savedPath, savedName);
		//파일을 실제로 저장[복사](바이트단위로 변화되 들어온 파일)
		FileCopyUtils.copy(fileData, target);
		//확장자 이름만 가져오기.
		//68092a8c-5459-4e37-bf77-092035768129_이미지명.PNG > "P"이전 텍스트 제거
	    
	    String uploadedFileName = savedPath+"/"+savedName;
	    logger.info(uploadedFileName);
	    
	    return uploadedFileName;

	}


	private static String calcPath(String uploadPath) {
		//현재 시스템의 날짜에 맞는 데이터를 얻기 위함.
		Calendar cal = Calendar.getInstance();
		//파일을 구분자 기준으로 '년' 값을 삽입한다. (File.separator: '\')
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		//'년'+'09'
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		//'년'+'09'+'19'
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		//파일을 저장할 위치와 년월일을 넘겨준다.
		makeDir(uploadPath, yearPath, monthPath, datePath);

		logger.info(datePath);

		return datePath;
	}

	private static void makeDir(String uploadPath, String... paths) {
		//해당파일이 존재하는지 확인한다. \2016\09\19
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		
		for (String path : paths) {
			//paths에는 년월일 값이 들어있다./2016, /2016/09/, /2016/09/10 순으로 검사한다.
			File dirPath = new File(uploadPath + path);
			
			//해당날짜로 된 폴더가 존재하지 않는다면 폴더를 생성한다.
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}

}
