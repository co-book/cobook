package org.ebook.cobook.board.domain;

import java.util.Date;

public class MybookVO {


    private Integer mybook_no;
    private Integer member_no;
    private String title;
    private String contents;
    private Integer hit;
    private Date reg_date;
    private String nickname;
	@Override
	public String toString() {
		return "MybookVO [mybook_no=" + mybook_no + ", member_no=" + member_no + ", title=" + title + ", contents="
				+ contents + ", hit=" + hit + ", reg_date=" + reg_date + ", nickname=" + nickname + "]";
	}
	public Integer getMybook_no() {
		return mybook_no;
	}
	public void setMybook_no(Integer mybook_no) {
		this.mybook_no = mybook_no;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


}
