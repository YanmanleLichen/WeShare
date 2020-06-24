package com.ws.service;

import java.util.List;

import com.ws.po.Message;

public interface MessageService {
	public List<Message> selectMessagesByBlogId(String blog_id);
	public int insertMessage(String msg_id,String blog_id,String msg_user,String msg_time,String msg_content);
	public int deleteMessageByMsgId(String msg_id);
}
