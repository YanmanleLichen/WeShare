package com.ws.po;

public class Blog {
	private String blog_id;
	private String blog_time;
	private String blog_user;
	private String blog_title;
	private String blog_type;
	private String blog_content;
	public Blog() {
		super();
	}
	public Blog(String blog_id, String blog_time, String blog_user, String blog_title, String blog_type,
			String blog_content) {
		super();
		this.blog_id = blog_id;
		this.blog_time = blog_time;
		this.blog_user = blog_user;
		this.blog_title = blog_title;
		this.blog_type = blog_type;
		this.blog_content = blog_content;
	}
	@Override
	public String toString() {
		return "Blog [blog_id=" + blog_id + ", blog_time=" + blog_time + ", blog_user=" + blog_user + ", blog_title="
				+ blog_title + ", blog_type=" + blog_type + ", blog_content=" + blog_content + "]";
	}
	public String getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(String blog_id) {
		this.blog_id = blog_id;
	}
	public String getBlog_time() {
		return blog_time;
	}
	public void setBlog_time(String blog_time) {
		this.blog_time = blog_time;
	}
	public String getBlog_user() {
		return blog_user;
	}
	public void setBlog_user(String blog_user) {
		this.blog_user = blog_user;
	}
	public String getBlog_title() {
		return blog_title;
	}
	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}
	public String getBlog_type() {
		return blog_type;
	}
	public void setBlog_type(String blog_type) {
		this.blog_type = blog_type;
	}
	public String getBlog_content() {
		return blog_content;
	}
	public void setBlog_content(String blog_content) {
		this.blog_content = blog_content;
	}
	
}
