package org.ebook.cobook.review.domain;

import java.util.Date;

public class ReviewVO {
	private int review_no;
	private int ebook_no;
	private int user_no;
	private String title;
	private String content;
	private int hit;
	private Date regdate;
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getEbook_no() {
		return ebook_no;
	}
	public void setEbook_no(int ebook_no) {
		this.ebook_no = ebook_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", ebook_no=" + ebook_no + ", user_no=" + user_no + ", title="
				+ title + ", content=" + content + ", hit=" + hit + ", regdate=" + regdate + "]";
	}
	
	

}
