package com.ws.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ws.dao.BlogDao;
import com.ws.po.Blog;
import com.ws.service.BlogService;

@Service("blogService")
@Transactional
public class BlogServiceImpl implements BlogService{
	@Autowired
	private BlogDao blogDao;
	@Override
	public List<Blog> selectAllBlogs() {
		List<Blog> blogs = this.blogDao.selectAllBlogs();
		return blogs;
	}
	@Override
	public List<Blog> selectBlogsLikeSearchList(String search, int start, int size) {
		List<Blog> blogs = this.blogDao.selectBlogsLikeSearchList(search, start, size);
		return blogs;
	}
	@Override
	public Blog selectBlogByBlogId(String blog_id) {
		Blog blog = this.blogDao.selectBlogByBlogId(blog_id);
		return blog;
	}
	@Override
	public int insertBlog(String blog_id, String blog_time, String blog_user,
			String blog_title, String blog_type, String blog_content) {
		int ret = this.blogDao.insertBlog(blog_id, blog_time, blog_user, blog_title, blog_type, blog_content);
		return ret;
	}
	@Override
	public List<Blog> selectAllBlogsList(int start, int size, String section) {
		List<Blog> blogs = this.blogDao.selectAllBlogsList(start, size, section);
		return blogs;
	}
	@Override
	public int selectBlogsCount(String section) {
		int ret = this.blogDao.selectBlogsCount(section);
		return ret;
	}
	@Override
	public int deleteBlogByBlogId(String blog_id) {
		int ret = this.blogDao.deleteBlogByBlogId(blog_id);
		return ret;
	}
	@Override
	public int updateBlogByBlogId(String blog_id, String blog_title, String blog_content) {
		int ret = this.blogDao.updateBlogByBlogId(blog_id, blog_title, blog_content);
		return ret;
	}
	@Override
	public int selectBlogsLikeSearchListCount(String search) {
		int ret = this.blogDao.selectBlogsLikeSearchListCount(search);
		return ret;
	}
}
