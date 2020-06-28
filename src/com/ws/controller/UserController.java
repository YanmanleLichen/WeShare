package com.ws.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

import com.ws.po.Blog;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ws.po.User;
import com.ws.service.UserService;
import com.ws.po.Relation;
import com.ws.service.RelationService;

@Controller
public class UserController {
	Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private RelationService relationService;
	@RequestMapping(value = "/Login.action", method = RequestMethod.POST)
	public String login(String user_name, String password, Model model, HttpSession session) {
		User user = userService.selectUserByUserNamePassword(user_name, password);
		if(user != null) {
			String time = user.getRegistdate().substring(0, 19);
			user.setRegistdate(time);
			session.setAttribute("currentUser", user);
			session.setAttribute("admin", null);
			logger.info(user);
			return "redirect:/toCenter.action";
		}
		model.addAttribute("msg", "账号密码错误或账号被冻结，请重新输入！");
		return "Login";
	}

	@RequestMapping(value = "/Regist.action", method = RequestMethod.POST)
	public String regist(Model model, String user_name, String password, String gender,
			String description,String identity) {
		String user_id = UUID.randomUUID().toString().replace("-", "");
		Date registdate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String bT = sdf.format(registdate);
		String user_state = "t";
		int ret = userService.insertUser(user_id, user_name, password, gender, description, bT, identity, user_state);
		if(ret > 0 ) {
			return "Login";
		}
		model.addAttribute("msg", "注册失败！");
		return "Regist";
	}
	@RequestMapping(value="/findUser.action", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
    public int ajaxValidate(HttpServletRequest request) {
        String user_name = request.getParameter("user_name");
		logger.info(user_name);
        User user = userService.selectUserByUserName(user_name);
        logger.info(user);
        int r;
        if(user == null){
        	r = 0; 
        }
        else{
        	r = 1;
        }
        return r;
    }
	@RequestMapping(value = "/Logout.action")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/toLogin.action";
	}
	@RequestMapping(value = "/toUserSpace.action")
	public String toUserSpace(HttpSession session, String user_name) {
		User currentUser =(User)session.getAttribute("currentUser");
		User user = userService.selectUserByUserName(user_name);
		int canFollow = -1;
		if(currentUser != null){
			int ret = relationService.followOrNot(currentUser.getUser_id(), user.getUser_id());
			if(ret == 1){
				canFollow = 0;
			}
			else {
				canFollow = 1;
			}
		}
		session.setAttribute("canFollow", canFollow);
		String time = user.getRegistdate().substring(0, 19);
		user.setRegistdate(time);
		session.setAttribute("SpaceUser", user);
		return "UserSpace";
	}
	@RequestMapping(value = "/toUpdateUser.action")
	public String toModifyUser(HttpSession session) {
		User user0 =(User)session.getAttribute("currentUser");
		String user_name = user0.getUser_name();
		User user = userService.selectUserByUserName(user_name);
		session.setAttribute("currentUser", user);
		return "ModifyUser";
	}
	@RequestMapping(value = "/updateUserByUserId.action")
	public String updateUserByUserId(String password, String gender, 
			String description, HttpSession session) {
		User user =(User)session.getAttribute("currentUser");
		String user_id = user.getUser_id();
		int ret = userService.updateUserById(user_id, password, gender, description);
		if(ret > 0) {
			return "redirect:/toUserSpace.action?user_name=" + user.getUser_name();
		}
		session.setAttribute("msg", "修改失败！");
		return "ModifyUser";
	}
	@RequestMapping(value = "/updateUserStateFreeze.action")
	public String updateUserStateFreeze(String user_id, HttpSession session){
		String freeze = "f";
		User user = userService.selectUserByUserId(user_id);
		int ret = userService.updateUserState(user_id, freeze);
		if(ret > 0){
			return "redirect:/toUserSpace.action?user_name=" + user.getUser_name();
		}
		session.setAttribute("msg", "修改失败！");
		return "redirect:/toUserSpace.action?user_name=" + user.getUser_name();
	}
	@RequestMapping(value = "/updateUserStateUnseal.action")
	public String updateUserStateUnseal(String user_id, HttpSession session){
		String unseal = "t";
		User user = userService.selectUserByUserId(user_id);
		int ret = userService.updateUserState(user_id, unseal);
		if(ret > 0){
			return "redirect:/toUserSpace.action?user_name=" + user.getUser_name();
		}
		session.setAttribute("msg", "修改失败！");
		return "redirect:/toUserSpace.action?user_name=" + user.getUser_name();
	}

	@RequestMapping(value = "/selectUsersList.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public JSONObject selectUsersList(HttpServletRequest request){
		int size = Integer.parseInt(request.getParameter("limit"));
		int start = (Integer.parseInt(request.getParameter("page")) - 1) * size;
		int ret = userService.selectUsersListCount();
		List<User> users = userService.selectUsersList(start, size);
		List<User> users1 = userService.selectUsersList(start, size);
		users1.clear();
		for(int i = 0; i <users.size(); i++){
			User user = users.get(i);
			user.setDescription("0");
			String time = user.getRegistdate().substring(0, 19);
			user.setRegistdate(time);
			user.setPassword("");
			if(user.getIdentity().equals("inside")){
				user.setIdentity("校内师生");
			}
			else {
				user.setIdentity("校外人士");
			}
			if(user.getUser_state().equals("t")){
				user.setUser_state("账号正常");
			}
			else{
				user.setUser_state("账号冻结");
			}
			users1.add(i, user);
		}
		JSONObject allusers = new JSONObject();
		allusers.put("code", 0);
		allusers.put("msg", "成功");
		allusers.put("count", ret);
		allusers.put("data", users1);
		return allusers;
	}

	@RequestMapping(value = "/focusOnUserByUserId.action")
	public String focusOnUserByUserId(HttpSession session, String user_id, String follow_user_id){
		String relation_id = UUID.randomUUID().toString().replace("-", "");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String follow_time = sdf.format(date);
		User user = userService.selectUserByUserId(follow_user_id);
		int ret = relationService.focusOnUserByUserId(relation_id, user_id, follow_user_id,follow_time);
		if(ret > 0){
			return "redirect:/toUserSpace.action?user_name=" + user.getUser_name();
		}
		session.setAttribute("msg", "关注失败！");
		return "redirect:/toUserSpace.action?user_name=" + user.getUser_name();
	}
	@RequestMapping(value = "/unFollowUserByUserId.action")
	public String unFollowUserByUserId(HttpSession session, String user_id, String follow_user_id){
		User user = userService.selectUserByUserId(follow_user_id);
		int ret = relationService.unFollowUserByUserId(user_id, follow_user_id);
		if(ret > 0){
			return "redirect:/toUserSpace.action?user_name=" + user.getUser_name();
		}
		session.setAttribute("msg", "取关失败！");
		return "redirect:/toUserSpace.action?user_name=" + user.getUser_name();
	}

	@RequestMapping(value = "/selectRelationsByUserId.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public JSONObject selectRelationsByUserId(HttpServletRequest request){
		String user_id = request.getParameter("user_id");
		int size = Integer.parseInt(request.getParameter("limit"));
		int start = (Integer.parseInt(request.getParameter("page")) - 1) * size;
		int ret = relationService.selectRelationsByUserIdCount(user_id);
		List<Relation> relations = relationService.selectRelationsByUserId(user_id, start, size);
		List<Relation> relations1 = relationService.selectRelationsByUserId(user_id, start, size);
		relations1.clear();
		for(int i = 0; i < relations.size(); i++){
			Relation relation = relations.get(i);
			User user = userService.selectUserByUserId(relation.getFollow_user_id());
			relation.setUser_id(user.getUser_name());
			String time = relation.getFollow_time().substring(0, 19);
			relation.setFollow_time(time);
			relations1.add(i, relation);
		}
		JSONObject allrelations = new JSONObject();
		allrelations.put("code", 0);
		allrelations.put("msg", "成功");
		allrelations.put("count", ret);
		allrelations.put("data", relations1);
		return allrelations;
	}

	@RequestMapping(value = "/selectRelationsByFollowUserId.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public JSONObject selectRelationsByFollowUserId(HttpServletRequest request){
		String follow_user_id = request.getParameter("follow_user_id");
		int size = Integer.parseInt(request.getParameter("limit"));
		int start = (Integer.parseInt(request.getParameter("page")) - 1) * size;
		int ret = relationService.selectRelationsByFollowUserIdCount(follow_user_id);
		List<Relation> relations = relationService.selectRelationsByFollowUserId(follow_user_id, start, size);
		List<Relation> relations1 = relationService.selectRelationsByFollowUserId(follow_user_id, start, size);
		relations1.clear();
		for(int i = 0; i < relations.size(); i++){
			Relation relation = relations.get(i);
			User user = userService.selectUserByUserId(relation.getUser_id());
			relation.setFollow_user_id(user.getUser_name());
			String time = relation.getFollow_time().substring(0, 19);
			relation.setFollow_time(time);
			relations1.add(i, relation);
		}
		JSONObject allrelations = new JSONObject();
		allrelations.put("code", 0);
		allrelations.put("msg", "成功");
		allrelations.put("count", ret);
		allrelations.put("data", relations1);
		return allrelations;
	}

	@RequestMapping(value = "/selectFollowUserBlogsByUserId.action", produces = "application/json;charset=utf-8")
	@ResponseBody
	public JSONObject selectFollowUserBlogsByUserId(HttpServletRequest request){
		String user_id = request.getParameter("user_id");
		int size = Integer.parseInt(request.getParameter("limit"));
		int start = (Integer.parseInt(request.getParameter("page")) - 1) * size;
		int ret = relationService.selectFollowUserBlogsByUserIdCount(user_id);
		List<Blog> blogs = relationService.selectFollowUserBlogsByUserId(user_id, start, size);
		logger.info(blogs);
		List<Blog> blogs1 = relationService.selectFollowUserBlogsByUserId(user_id, start, size);
		blogs1.clear();
		for (int i = 0; i < blogs.size(); i++) {
			Blog blog = blogs.get(i);
			blog.setBlog_content("0");
			String time = blog.getBlog_time().substring(0, 19);
			blog.setBlog_time(time);
			blogs1.add(i, blog);
		}
		JSONObject allblogs = new JSONObject();
		allblogs.put("code", 0);
		allblogs.put("msg", "成功");
		allblogs.put("count", ret);
		allblogs.put("data", blogs1);
		return allblogs;
	}
}
