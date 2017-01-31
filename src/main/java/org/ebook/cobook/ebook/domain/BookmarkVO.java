package org.ebook.cobook.ebook.domain;

import java.util.Date;

public class BookmarkVO {

	private Integer bookmark_no;
	private Integer member_no;
	private Integer ebook_no;
	private String ebookPage;
	private String chapter;
	private String mybookmark;
	private Date readDate;
	
	public Integer getBookmark_no() {
		return bookmark_no;
	}
	public void setBookmark_no(Integer bookmark_no) {
		this.bookmark_no = bookmark_no;
	}
	public Integer getMember_no() {
		return member_no;
	}
	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}
	public Integer getEbook_no() {
		return ebook_no;
	}
	public void setEbook_no(Integer ebook_no) {
		this.ebook_no = ebook_no;
	}
	public String getEbookPage() {
		return ebookPage;
	}
	public void setEbookPage(String ebookPage) {
		this.ebookPage = ebookPage;
	}
	public Date getReadDate() {
		return readDate;
	}
	public void setReadDate(Date readDate) {
		this.readDate = readDate;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getMybookmark() {
		return mybookmark;
	}
	public void setMybookmark(String mybookmark) {
		this.mybookmark = mybookmark;
	}

	
} 