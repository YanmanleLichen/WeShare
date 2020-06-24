package com.ws.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ws.dao.MessageDao;
import com.ws.po.Message;
import com.ws.service.MessageService;

@Service("messageService")
@Transactional
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDao messageDao;
	@Override
	public List<Message> selectMessagesByBlogId(String blog_id) {
		List<Message> messgaes = this.messageDao.selectMessagesByBlogId(blog_id);
		return messgaes;
	}
	@Override
	public int insertMessage(String msg_id, String blog_id, String msg_user, String msg_time, String msg_content) {
		int ret = this.messageDao.insertMessage(msg_id, blog_id, msg_user, msg_time, msg_content);
		return ret;
	}
	@Override
	public int deleteMessageByMsgId(String msg_id) {
		int ret = this.messageDao.deleteMessageByMsgId(msg_id);
		return ret;
	}

}
