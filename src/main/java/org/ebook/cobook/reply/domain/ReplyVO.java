package org.ebook.cobook.reply.domain;

import java.util.Date;

public class ReplyVO {

	private Integer replyno; //--댓글번호
	private Integer boardno; //--게시물 번호
	private String replycont; //-- 댓글
	private Date regdate; //-- 등록날짜
	private int reparent; //-- 댓글부모번호
	private int redepth; //-- 댓글 레벨
	private int reorder; //-- 댓글 순서
	private String user_id; // 유저 id
	public Integer getReplyno() {
		return replyno;
	}
	public void setReplyno(Integer replyno) {
		this.replyno = replyno;
	}
	public Integer getBoardno() {
		return boardno;
	}
	public void setBoardno(Integer boardno) {
		this.boardno = boardno;
	}
	public String getReplycont() {
		return replycont;
	}
	public void setReplycont(String replycont) {
		this.replycont = replycont;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReparent() {
		return reparent;
	}
	public void setReparent(int reparent) {
		this.reparent = reparent;
	}
	public int getRedepth() {
		return redepth;
	}
	public void setRedepth(int redepth) {
		this.redepth = redepth;
	}
	public int getReorder() {
		return reorder;
	}
	public void setReorder(int reorder) {
		this.reorder = reorder;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyno=" + replyno + ", boardno=" + boardno + ", replycont=" + replycont + ", regdate="
				+ regdate + ", reparent=" + reparent + ", redepth=" + redepth + ", reorder=" + reorder + ", user_id="
				+ user_id + "]";
	}
	
	
	
}
