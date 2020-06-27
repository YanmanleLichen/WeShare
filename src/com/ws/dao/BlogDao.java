package com.ws.dao;

import org.apache.ibatis.annotations.Param;
import java.util.List;

import com.ws.po.Blog;

public interface BlogDao {
	public List<Blog> selectAllBlogs();
	public List<Blog> selectBlogsLikeSearchList(
			@Param("search") String search,
			@Param("start") Integer start,
			@Param("size") Integer size
			);
	public Blog selectBlogByBlogId(
			@Param("blog_id") String blog_id);
	public List<Blog> selectAllBlogsByUserId(
			@Param("blog_user") String blog_user,
			@Param("start") Integer start,
			@Param("size") Integer size
		);
	public int selectAllBlogsCountByUserId(
			@Param("blog_user") String blog_user
	);
	public int insertBlog(
			@Param("blog_id") String blog_id,
			@Param("blog_time") String blog_time,
			@Param("blog_user") String blog_user,
			@Param("blog_title") String blog_title,
			@Param("blog_type") String blog_type,
			@Param("blog_content") String blog_content
			);
	public List<Blog> selectAllBlogsList(
			@Param("start") Integer start,
			@Param("size") Integer size,
			@Param("section") String section
			);
	public int selectBlogsCount(
			@Param("section") String section
			);
	public int selectBlogsLikeSearchListCount(
			@Param("search") String search);
	public int deleteBlogByBlogId(
			@Param("blog_id") String blog_id
			);
	public int updateBlogByBlogId(
			@Param("blog_id") String blog_id,
			@Param("blog_title") String blog_title,
			@Param("blog_content") String blog_content
			);
}
