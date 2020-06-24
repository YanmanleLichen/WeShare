package com.ws.po;

public class Message {
	private String msg_id;
	private String blog_id;
	private String msg_user;
	private String msg_time;
	private String msg_content;
	public Message() {
		
	}
	public Message(String msg_id, String blog_id, String msg_user, String msg_time, String msg_content) {
		super();
		this.msg_id = msg_id;
		this.blog_id = blog_id;
		this.msg_user = msg_user;
		this.msg_time = msg_time;
		this.msg_content = msg_content;
	}
	@Override
	public String toString() {
		return "Message [msg_id=" + msg_id + ", blog_id=" + blog_id + ", msg_user=" + msg_user + ", msg_time="
				+ msg_time + ", msg_content=" + msg_content + "]";
	}
	
	public String getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(String msg_id) {
		this.msg_id = msg_id;
	}
	public String getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(String blog_id) {
		this.blog_id = blog_id;
	}
	public String getMsg_user() {
		return msg_user;
	}
	public void setMsg_user(String msg_user) {
		this.msg_user = msg_user;
	}
	public String getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(String msg_time) {
		this.msg_time = msg_time;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	
	
}
