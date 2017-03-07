package org.ebook.cobook.member.domain;

public class MemberVO {

	private int member_no;
	private String nickname;
	private String password;
	private String sex;
	private int age;
	private int myPoint;
	private String email;
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getMyPoint() {
		return myPoint;
	}
	public void setMyPoint(int myPoint) {
		this.myPoint = myPoint;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "MemberVO [member_no=" + member_no + ", nickname=" + nickname + ", password=" + password + ", sex=" + sex
				+ ", age=" + age + ", myPoint=" + myPoint + ", email=" + email + "]";
	}
	
	
	
	
}
