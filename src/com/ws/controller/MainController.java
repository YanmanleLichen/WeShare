package com.ws.controller;

import com.ws.po.Blog;
import com.ws.service.BlogService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
public class MainController {
	Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	private BlogService blogService;
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
	@RequestMapping(value="/toIndex.action")
	public String toIndex(HttpSession session) {
		List<Blog> blogs = ExploreBlogs();
		session.setAttribute("exploreBlogs", blogs);
		System.out.println("toIndex.action");
		return "index";
	}
	@RequestMapping(value="/toCenter.action")
	public String toCenter(HttpSession session) {
		List<Blog> blogs = ExploreBlogs();
		session.setAttribute("exploreBlogs", blogs);
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
	@RequestMapping(value="/toSearch.action")
	public String toSearch(HttpSession session) {
		List<Blog> blogs = ExploreBlogs();
		session.setAttribute("exploreBlogs", blogs);
		System.out.println("toSearch.action");
		return "Search";
	}
	@RequestMapping(value = "/toSection.action")
	public String toSection(HttpSession session, Model model, String blog_type) {
		List<Blog> blogs = ExploreBlogs();
		session.setAttribute("exploreBlogs", blogs);
		model.addAttribute("blog_type", blog_type);
		return "Section";
	}
}
