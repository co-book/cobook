package org.ebook.cobook.good.domain;

public class GoodVO {

	private int good_no;
	private int user_no;
	private int board_no;
	private String board_name;
	public int getGood_no() {
		return good_no;
	}
	public void setGood_no(int good_no) {
		this.good_no = good_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	@Override
	public String toString() {
		return "GoodVO [good_no=" + good_no + ", user_no=" + user_no + ", board_no=" + board_no + ", board_name="
				+ board_name + "]";
	}




}
