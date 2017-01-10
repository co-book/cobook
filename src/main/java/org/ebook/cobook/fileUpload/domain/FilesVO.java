package org.ebook.cobook.fileUpload.domain;

public class FilesVO {

	private Integer file_no;
	private String filename;
	private String fileurl;
	private Integer book_no;
	private String book_type;
	private String filetype;
	
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
	@Override
	public String toString() {
		return "Files [file_no=" + file_no + ", filename=" + filename + ", fileurl=" + fileurl + ", book_no=" + book_no
				+ ", book_type=" + book_type + ", filetype=" + filetype + "]";
	}

	

}
