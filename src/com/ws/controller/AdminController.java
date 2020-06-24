package com.ws.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ws.po.Admin;
import com.ws.service.AdminService;

@Controller
public class AdminController {
	Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	private AdminService adminService;
	@RequestMapping(value = "/AdminLogin.action", method = RequestMethod.POST)
	public String login(String admin_name, String password, Model model, HttpSession session) {
		Admin admin = adminService.selectAdminByAdminNamePassword(admin_name, password);
		if(admin != null) {
			session.setAttribute("admin", admin);
			session.setAttribute("currentUser", null);
			logger.info(admin);
			return "redirect:/toAdminCenter.action";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
		return "AdminLogin";
	}
}
