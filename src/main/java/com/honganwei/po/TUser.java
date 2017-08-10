package com.honganwei.po;

import java.util.Date;


public class TUser implements java.io.Serializable {


	private Integer username;
	private String password;
	private String nickname;
	private Date birthday;
	private Integer sex;
	private String mobile;
	private String address;
	private Integer rank;
	private Date regtime;
	private String regip;
	

	
	public TUser() {
	}
	
	public TUser(Integer username, String password) {
		this.username = username;
		this.password = password;
	}
	
	public TUser(Integer username, String password, String nickname, Date birthday, Integer sex, String mobile,
			String address, Integer rank, Date regtime, String regip) {
		this.username = username;
		this.password = password;
		this.nickname = nickname;
		this.birthday = birthday;
		this.sex = sex;
		this.mobile = mobile;
		this.address = address;
		this.rank = rank;
		this.regtime = regtime;
		this.regip = regip;
	}

	
	
	public String toString() {
		return "TUser [username=" + username + ", password=" + password + ", nickname=" + nickname + ", birthday="
				+ birthday + ", sex=" + sex + ", mobile=" + mobile + ", address=" + address + ", rank=" + rank
				+ ", regtime=" + regtime + ", regip=" + regip + "]";
	}
	public Integer getUsername() {
		return username;
	}
	public void setUsername(Integer username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	public String getRegip() {
		return regip;
	}
	public void setRegip(String regip) {
		this.regip = regip;
	}

	

	
}