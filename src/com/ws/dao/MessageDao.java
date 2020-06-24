package com.ws.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ws.po.Message;

public interface MessageDao {
	public List<Message> selectMessagesByBlogId(
		@Param("blog_id") String blog_id	
	);
	public int insertMessage(
		@Param("msg_id") String msg_id,
		@Param("blog_id") String blog_id,
		@Param("msg_user") String msg_user,
		@Param("msg_time") String msg_time,
		@Param("msg_content") String msg_content
			);
	public int deleteMessageByMsgId(
		@Param("msg_id") String msg_id
		);
}
