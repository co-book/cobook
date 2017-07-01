package org.ebook.cobook.board.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;
//Alias는 mybatis 설정에서 vo를 등록할때 별칭을 따로 부여함으로 mapper에서 별칭으로 연결시켜주는것
@Alias("ReviewVO")
public class ReviewVO {
	 private Integer review_no; 		//리뷰 번호
     private Integer ebook_no; 			//리뷰할 책 제목
     private Integer member_no; 		//사용자 번호
     private String title; 				//제목
     private String contents; 			//내용
     private Integer hit; 				//조회수
     private Date reg_date; 			//작성날짜
     private Float evaluate; 			//평점
     private String[] files; 			//에디터에 입력된 파일들  - 글쓰기할때 사용
     
    
     private String ebookTitle;			//EBOOK의 책제목 		리스트에서 사용
     private String coverurl;			//Ebook의 CoverURL	리스트에서 사용
     private String nickname;			//작성자 닉네임			리스트에서 사용
     
     //?
     private String category; 			//어떤 장르인지		?
     
     
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
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
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getEbookTitle() {
		return ebookTitle;
	}
	public void setEbookTitle(String ebook_title) {
		this.ebookTitle = ebook_title;
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
				+ evaluate + ", files=" + files.toString() + ", category=" + category + ", ebook_title=" + ebookTitle
				+ ", coverurl=" + coverurl + ", nickname=" + nickname + "]";
	}
	
	

}
