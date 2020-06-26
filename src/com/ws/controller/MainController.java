package com.ws.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping(value="/toIndex.action")
	public String toIndex() {
		System.out.println("toIndex.action");
		return "index";
	}
	@RequestMapping(value="/toCenter.action")
	public String toCenter() {
		System.out.println("toCenter.action");
		return "Center";
	}
	
	@RequestMapping(value="/toLogin.action")
	public String toLogin() {
		System.out.println("toLogin.action");
		return "Login";
	}
	
	@RequestMapping(value="/toRegist.action")
	public String toRegist() {
		System.out.println("toRegist.action");
		return "Regist";
	}
	@RequestMapping(value="/toAddBlog.action")
	public String toAddBlog() {
		System.out.println("toAddBlog.action");
		return "AddBlog";
	}
	@RequestMapping(value="/toAddAdminBlog.action")
	public String toAddAdminBlog() {
		System.out.println("toAddAdminBlog.action");
		return "AddAdminBlog";
	}
	@RequestMapping(value="/toAdminLogin.action")
	public String toAdmin() {
		System.out.println("toAdminLogin.action");
		return "AdminLogin";
	}
	@RequestMapping(value="/toAdminCenter.action")
	public String toAdminCenter() {
		System.out.println("toAdminCenter.action");
		return "AdminCenter";
	}
	@RequestMapping(value="/toAddLicence.action")
	public String toAddLicence() {
		System.out.println("toAddLicence.action");
		return "AddLicence";
	}
	@RequestMapping(value="/toSearch.action")
	public String toSearch() {
		System.out.println("toSearch.action");
		return "Search";
	}
}
