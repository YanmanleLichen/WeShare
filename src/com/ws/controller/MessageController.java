package com.ws.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ws.po.Message;
import com.ws.service.BlogService;
import com.ws.service.MessageService;
import com.ws.po.Admin;
import com.ws.po.Blog;
import com.ws.po.User;

@Controller
public class MessageController {
	Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	private BlogService blogService;
	@Autowired
	private MessageService messageService;
	@RequestMapping(value = "/selectMessagesByBlogId.action")
	public String selectMessagesBybId(Model model, HttpSession session, String blog_id,HttpServletRequest request) {
		List<Message> messages = messageService.selectMessagesByBlogId(blog_id);
		List<Message> messages1 = messageService.selectMessagesByBlogId(blog_id);
		messages1.clear();
		for(int i = 0; i <messages.size(); i++) {
			Message message = messages.get(i);
			String msg_time = message.getMsg_time().substring(0, 19);
			message.setMsg_time(msg_time);
			System.out.println(message.toString());
			messages1.add(i, message);
			System.out.println(messages1.toString());
		}
		Blog blog = blogService.selectBlogByBlogId(blog_id);
		String blog_time = blog.getBlog_time().substring(0, 19);
		blog.setBlog_time(blog_time);
		session.setAttribute("b", blog);
		session.setAttribute("messages", messages1);
		List<Blog> blogs = ExploreBlogs();
		session.setAttribute("exploreBlogs", blogs);
		if(!messages.isEmpty()) {
			return "Details";
		}
		model.addAttribute("msg", "没有评论，快抢沙发！");
		return "Details";
	}
	
	@RequestMapping(value = "/insertMessage.action")
	public String insertMessage(Model model, HttpSession session,String msg_content) {
		String msg_id = UUID.randomUUID().toString().replace("-", "");
		Date bTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String blog_time = sdf.format(bTime);
		User currentUser = (User)session.getAttribute("currentUser");
		Admin admin = (Admin)session.getAttribute("admin");
		String msg_user = null;
		if(currentUser == null) {
			msg_user = admin.getAdmin_name();
		}
		else {
			msg_user = currentUser.getUser_name();
		}
		Blog b =(Blog)session.getAttribute("b");
		String blog_id = b.getBlog_id();
		int ret = messageService.insertMessage(msg_id, blog_id, msg_user, blog_time, msg_content);
		if(ret > 0) {
			return "redirect:/selectBlogByBlogId.action?blog_id=" + b.getBlog_id();
		}
		model.addAttribute("msg", "评论失败！");
		return "redirect:/selectBlogByBlogId.action?blog_id=" + b.getBlog_id();
	}
	@RequestMapping(value = "/deleteMessageByMsgId.action")
	public String deleteMessageBymId(String msg_id, Model model, HttpSession session, String blog_id) {
		int ret = messageService.deleteMessageByMsgId(msg_id);
		if(ret > 0) {
			return "redirect:/selectBlogByBlogId.action?blog_id=" + blog_id;
		}
		model.addAttribute("msg", "评论失败！");
		return "redirect:/selectBlogByBlogId.action?blog_id=" + blog_id;
	}
	public List<Blog> ExploreBlogs(){
		List<Blog> blogs1 = blogService.selectAllBlogs();
		List<Blog> blogs2 = blogService.selectAllBlogs();
		List<Integer> list = new ArrayList<>();
		blogs2.clear();
		int count = blogs1.size();
		Random random = new Random();
		for(int i = 0; i > -1; i++){
			int r = random.nextInt(count);
			if(list.indexOf(r) < 0){
				blogs2.add(blogs1.get(r));
				list.add(r);
			}
			if(list.size() == 3){
				break;
			}
		}
		logger.info(blogs2);
		list.clear();
		return blogs2;
	}
}
