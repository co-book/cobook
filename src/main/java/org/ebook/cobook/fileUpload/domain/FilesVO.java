package org.ebook.cobook.fileUpload.domain;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class FilesVO {

	private Integer file_no;
	private String filename;
	private String fileurl;
	private Integer book_no;
	private String book_type;
	private String filetype;
	private MultipartFile coverFile;
	
	private String[] files;

	public void printFile(){
		for(int i = 0; i < this.files.length; i++){
			System.out.println("index : " + i + "파일 : " + files[i].toString());
		}
	}
	
	
	
	// 파일 등록,수정 하는경우에 파일 풀네임을 파싱하는 함수
	public void parsingFileData(String fullnameFile) {

			System.out.println("파일풀네임: "+fullnameFile);
			 
			// 파일 url추출
			this.fileurl = "/resources/summernote_upload"+fullnameFile.substring(fullnameFile.indexOf("=") + 1);
			// 파일 이름 추출
			this.filename = fileurl.substring(fileurl.lastIndexOf("_") + 1);
			// 확장자 추출
			this.filetype = fileurl.substring(fileurl.indexOf(".") + 1);

	}

	@Override
	public String toString() {
		return "FilesVO [file_no=" + file_no + ", filename=" + filename + ", fileurl=" + fileurl + ", book_no="
				+ book_no + ", book_type=" + book_type + ", filetype=" + filetype + ", coverFile=" + coverFile
				+ ", files=" + Arrays.toString(files) + "]";
	}

	public Integer getFile_no() {
		return file_no;
	}

	public void setFile_no(Integer file_no) {
		this.file_no = file_no;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFileurl() {
		return fileurl;
	}

	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}

	public Integer getBook_no() {
		return book_no;
	}

	public void setBook_no(Integer book_no) {
		this.book_no = book_no;
	}

	public String getBook_type() {
		return book_type;
	}

	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public MultipartFile getCoverFile() {
		return coverFile;
	}

	public void setCoverFile(MultipartFile coverFile) {
		this.coverFile = coverFile;
	}

	

}
