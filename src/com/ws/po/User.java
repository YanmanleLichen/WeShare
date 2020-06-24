package com.ws.po;

public class User {
	private String user_id;
	private String user_name;
	private String password;
	private String gender;
	private String description;
	private String registdate;
	private String identity;
	private String user_state;
	public User() {
		super();
	}
	public User(String user_id, String user_name, String password, String gender, String description, String registdate,
			String identity, String user_state) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.password = password;
		this.gender = gender;
		this.description = description;
		this.registdate = registdate;
		this.identity = identity;
		this.user_state = user_state;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", password=" + password + ", gender=" + gender
				+ ", description=" + description + ", registdate=" + registdate + ", identity=" + identity
				+ ", user_state=" + user_state + "]";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRegistdate() {
		return registdate;
	}
	public void setRegistdate(String registdate) {
		this.registdate = registdate;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	
	
	
}
