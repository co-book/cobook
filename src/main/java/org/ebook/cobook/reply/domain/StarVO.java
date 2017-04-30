package org.ebook.cobook.reply.domain;

import org.apache.ibatis.type.Alias;
@Alias("StarVO")
public class StarVO {

	private Integer star_no;	//no
	private int starpoint;		//점수
	private int user_no;		//사용자
	private int reply_no;		//어떤 리플인지 리플번호
	private int ebook_no;		//어떤 ebook 인지 ebookno
	public Integer getStar_no() {
		return star_no;
	}
	public void setStar_no(Integer star_no) {
		this.star_no = star_no;
	}
	public int getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(int starpoint) {
		this.starpoint = starpoint;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getEbook_no() {
		return ebook_no;
	}
	public void setEbook_no(int ebook_no) {
		this.ebook_no = ebook_no;
	}
	
	@Override
	public String toString() {
		return "StarVO [star_no=" + star_no + ", starpoint=" + starpoint + ", user_no=" + user_no + ", reply_no="
				+ reply_no + ", ebook_no=" + ebook_no + "]";
	}

	
	
}
