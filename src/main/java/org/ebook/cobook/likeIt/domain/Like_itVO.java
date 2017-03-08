package org.ebook.cobook.likeIt.domain;

public class Like_itVO {

	private Integer like_it_no;
	private Integer member_no;
	private Integer reply_no;
	
	public Integer getLike_it_no() {
		return like_it_no;
	}
	public void setLike_it_no(Integer like_it_no) {
		this.like_it_no = like_it_no;
	}
	public Integer getMember_no() {
		return member_no;
	}
	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}
	public Integer getReply_no() {
		return reply_no;
	}
	public void setReply_no(Integer reply_no) {
		this.reply_no = reply_no;
	}
	@Override
	public String toString() {
		return "like_itVO [like_it_no=" + like_it_no + ", member_no=" + member_no + ", reply_no=" + reply_no + "]";
	}
	
}
