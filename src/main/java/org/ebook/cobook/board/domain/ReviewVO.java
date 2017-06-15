package org.ebook.cobook.board.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;


public class ReviewVO {
	 private Integer review_no; //데헷 등장^.~
     private Integer ebook_no; //어떤이뷱을
     private Integer member_no; //누가
     private String title; 	//어떤 글제목으로
     private String contents; 	//내용썼니
     private Integer hit; 	//조회수
     private Date reg_date; 	//작성날짜
     private Float evaluate; 	//평점은 내가매긴다
     private String fileurl; 	//						일단 남겨둠
     private String category; 	//어떤 장르인지
     private String ebook_title;	//어떤책제목을
     private String coverurl;	//어떤책사진가꼬와?
     private String nickname;	//시로시로 닉네임으로 작성할끄야
	public String getCoverurl() {	
		return coverurl;
	}
	public void setCoverurl(String coverurl) {
		this.coverurl = coverurl;
	}
	public Integer getReview_no() {
		return review_no;
	}
	public void setReview_no(Integer review_no) {
		this.review_no = review_no;
	}
	public Integer getEbook_no() {
		return ebook_no;
	}
	public void setEbook_no(Integer ebook_no) {
		this.ebook_no = ebook_no;
	}
	public Integer getMember_no() {
		return member_no;
	}
	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getHit() {
		return hit;
	}
	public void setHit(Integer hit) {
		this.hit = hit;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Float getEvaluate() {
		return evaluate;
	}
	public void setEvaluate(Float evaluate) {
		this.evaluate = evaluate;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getEbook_title() {
		return ebook_title;
	}
	public void setEbook_title(String ebook_title) {
		this.ebook_title = ebook_title;
	}

	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", ebook_no=" + ebook_no + ", member_no=" + member_no + ", title="
				+ title + ", contents=" + contents + ", hit=" + hit + ", reg_date=" + reg_date + ", evaluate="
				+ evaluate + ", fileurl=" + fileurl + ", category=" + category + ", ebook_title=" + ebook_title
				+ ", coverurl=" + coverurl + ", nickname=" + nickname + "]";
	}
	
     
     
   
	

}
