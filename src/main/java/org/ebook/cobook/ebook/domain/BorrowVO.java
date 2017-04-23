package org.ebook.cobook.ebook.domain;

import java.util.Date;

public class BorrowVO {
	
	private Integer borrow_no;
	private Integer member_no;
	private Integer ebook_no;
	private Date borrowDate;
	private Integer period;
	private Integer price;
	private String status;
	private String readPage;
	
	public Integer getBorrow_no() {
		return borrow_no;
	}
	public void setBorrow_no(Integer borrow_no) {
		this.borrow_no = borrow_no;
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
	public Date getBorrowDate() {
		return borrowDate;
	}
	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}
	public Integer getPeriod() {
		return period;
	}
	public void setPeriod(Integer period) {
		this.period = period;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrcie(Integer price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReadPage() {
		return readPage;
	}
	public void setReadPage(String readPage) {
		this.readPage = readPage;
	}

} 