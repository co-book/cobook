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

	// 1.UUID를 이용한 고유한 값 생성
	// 2.UUID와 결합한 업로드 파일 이름 생성
	// 3.파일이 저장될 '/년/월/일' 정보 생성
	// 4.업로드 기본 경로(uploadPath)와 '/년/월/일' 폴더 생성
	// 5.기본경로 + 파일경로 + 파일이름으로 파일 저장
	public static String uploadEditorFile(String uploadPath, String originalName, byte[] fileData) throws Exception {

		// 파일의 중복된 이름을 피하기 위해 생성
		UUID uid = UUID.randomUUID();
		// 128bit+'_'+파일명
		String savedName = uid.toString() + "_" + originalName;
		// 'uploadPath + 2016/06/10'형태의 파일명
		String savedPath = calcPath(uploadPath).replace(File.separator, "/");
		// 실저장path + 날자형식 , 파일명
		File target = new File(uploadPath + savedPath, savedName);
		// 파일을 실제로 저장[복사](바이트단위로 변화되 들어온 파일)
		FileCopyUtils.copy(fileData, target);
		// 확장자 이름만 가져오기.
		// 68092a8c-5459-4e37-bf77-092035768129_이미지명.PNG > "P"이전 텍스트 제거

		// 이미지타입인지 아닌지 검사하기위해 포멧명을 추출
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);

		String uploadedFileName = savedPath + "/" + savedName;

		// 이미지타입일 경우 makethumbnail함수 실행
		// 아닐경우 makeIcon 메서드 실행
		if (MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			// 문자열 치환용도의 함수
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}

		logger.info(uploadedFileName);

		return uploadedFileName;

	}

	private static String calcPath(String uploadPath) {
		// 현재 시스템의 날짜에 맞는 데이터를 얻기 위함.
		Calendar cal = Calendar.getInstance();
		// 파일을 구분자 기준으로 '년' 값을 삽입한다. (File.separator: '\')
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		// '년'+'09'
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		// '년'+'09'+'19'
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		// 파일을 저장할 위치와 년월일을 넘겨준다.
		makeDir(uploadPath, yearPath, monthPath, datePath);

		logger.info(datePath);

		return datePath;
	}

	private static void makeDir(String uploadPath, String... paths) {
		// 해당파일이 존재하는지 확인한다. \2016\09\19
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {
			// paths에는 년월일 값이 들어있다./2016, /2016/09/, /2016/09/10 순으로 검사한다.
			File dirPath = new File(uploadPath + path);

			// 해당날짜로 된 폴더가 존재하지 않는다면 폴더를 생성한다.
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}

	// 썸네일 처리를하는 함수
	public static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {

		// BufferedImage 메모리상의 이미지를 의미하는 객체
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));

		// 정해진 크기에맞게 사이즈를 지정해줌
		BufferedImage destImg = Scalr.resize(sourceImg, 350,300);

		// 썸네일 이름을 설정 파일명앞에 s_붙어줌
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;

		// 썸네일이름을가진 파일객체생성
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		// 썸네일 생성코드
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	// 문자열 치환용도의 메서드
	private static String makeIcon(String uploadPath, String path, String fileName) {

		String iconName = uploadPath + path + File.separator + fileName;

		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
