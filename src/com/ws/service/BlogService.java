package com.ws.service;

import java.util.List;

import com.ws.po.Blog;


public interface BlogService {
	public List<Blog> selectAllBlogs();
	public Blog selectBlogByBlogId(String blog_id);
	public int insertBlog(String blog_id, String blog_timr, String blog_user, 
			String blog_title, String blog_type, String blog_content);
	public List<Blog> selectAllBlogsList(int start, int size, String section);
	public int selectBlogsCount(String section);
	public int deleteBlogByBlogId(String blog_id);
	public int updateBlogByBlogId(String blog_id,String blog_title,String blog_content);
	public List<Blog> selectBlogsLikeSearchList(String search, int start, int size);
	public int selectBlogsLikeSearchListCount(String search);
}
