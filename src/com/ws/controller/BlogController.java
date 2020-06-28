package com.ws.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import com.ws.po.Admin;
import com.ws.po.Blog;
import com.ws.service.BlogService;

import com.ws.po.User;

@Controller
public class BlogController {
    Logger logger = Logger.getLogger(UserController.class);
    @Autowired
    private BlogService blogService;

    @RequestMapping(value = "/selectBlogByBlogId.action")
    public String selectBlogBybId(String blog_id) {
        return "redirect:/selectMessagesByBlogId.action?blog_id=" + blog_id;
    }

    @RequestMapping(value = "/insertBlog.action")
    public String insertBlog(HttpSession session, String blog_title,
                             String blog_content, String blog_type) {
        String blog_id = UUID.randomUUID().toString().replace("-", "");
        Date bTime = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String blog_time = sdf.format(bTime);
        User currentUser = (User) session.getAttribute("currentUser");
        String blog_user = currentUser.getUser_name();
        int ret = blogService.insertBlog(blog_id, blog_time, blog_user, blog_title, blog_type, blog_content);
        if (ret > 0) {
            return "redirect:/selectMessagesByBlogId.action?blog_id=" + blog_id;
        }
        session.setAttribute("msg", "发表信息失败！");
        return "AddBlog";
    }

    @RequestMapping(value = "/insertAdminBlog.action")
    public String insertAdminBlog(HttpSession session, String blog_title,
                                  String blog_content) {
        String blog_id = UUID.randomUUID().toString().replace("-", "");
        Date bTime = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String blog_time = sdf.format(bTime);
        String blog_type = "系统公告";
        Admin admin = (Admin) session.getAttribute("admin");
        String blog_user = admin.getAdmin_name();
        int ret = blogService.insertBlog(blog_id, blog_time, blog_user, blog_title, blog_type, blog_content);
        if (ret > 0) {
            return "redirect:toCenter.action";
        }
        session.setAttribute("msg", "发布公告失败！");
        return "AddAdminBlog";
    }

    @RequestMapping(value = "/selectBlogsLikeSearch.action", produces = "application/json;charset=utf-8")
    @ResponseBody
    public JSONObject selectBlogsLikeSearch(HttpServletRequest request) {
        String search = request.getParameter("search");
        int size = Integer.parseInt(request.getParameter("limit"));
        int start = (Integer.parseInt(request.getParameter("page")) - 1) * size;
        List<Blog> blogs = blogService.selectBlogsLikeSearchList(search, start, size);
        List<Blog> blogs1 = blogService.selectBlogsLikeSearchList(search, start, size);
        blogs1.clear();
        for (int i = 0; i < blogs.size(); i++) {
            Blog blog = blogs.get(i);
            blog.setBlog_content("0");
            String time = blog.getBlog_time().substring(0, 19);
            blog.setBlog_time(time);
            blogs1.add(i, blog);
        }
        int ret = blogService.selectBlogsLikeSearchListCount(search);
        JSONObject allblogs = new JSONObject();
        allblogs.put("code", 0);
        allblogs.put("msg", "成功");
        allblogs.put("count", ret);
        allblogs.put("data", blogs1);
        return allblogs;
    }

    @RequestMapping(value = "/selectAllBlogsList.action", produces = "application/json;charset=utf-8")
    @ResponseBody
    public JSONObject selectAllBlogsList(HttpServletRequest request) {
        String section = request.getParameter("blog_type");
        int size = Integer.parseInt(request.getParameter("limit"));
        int start = (Integer.parseInt(request.getParameter("page")) - 1) * size;
        int ret = blogService.selectBlogsCount(section);
        List<Blog> blogs = blogService.selectAllBlogsList(start, size, section);
        List<Blog> blogs1 = blogService.selectAllBlogsList(start, size, section);
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

    @RequestMapping(value = "/selectAllBlogsByUserId.action", produces = "application/json;charset=utf-8")
    @ResponseBody
    public JSONObject selectAllBlogsByUserId(HttpServletRequest request) {
        String blog_user = request.getParameter("blog_user");
        int size = Integer.parseInt(request.getParameter("limit"));
        int start = (Integer.parseInt(request.getParameter("page")) - 1) * size;
        int ret = blogService.selectAllBlogsCountByUserId(blog_user);
        List<Blog> blogs = blogService.selectAllBlogsByUserId(blog_user, start, size);
        List<Blog> blogs1 = blogService.selectAllBlogsByUserId(blog_user, start, size);
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

    @RequestMapping(value = "/deleteBlogByBlogId.action")
    public String deleteBlogBybId(HttpSession session, String blog_id) {
        int ret = blogService.deleteBlogByBlogId(blog_id);
        System.out.println(ret);
        if (ret > 0) {
            return "redirect:toCenter.action";
        }
        session.setAttribute("msg", "删除失败！");
        return "Center";
    }

    @RequestMapping(value = "/toUpdateBlog.action")
    public String toUpdateBlog(String blog_id, HttpSession session) {
        Blog blog = blogService.selectBlogByBlogId(blog_id);
        session.setAttribute("blog", blog);
        return "ModifyBlog";
    }

    @RequestMapping(value = "/updateBlogByBlogId.action")
    public String updateBlogBybId(String blog_id, String blog_title, String blog_content, HttpSession session) {
        int ret = blogService.updateBlogByBlogId(blog_id, blog_title, blog_content);
        if (ret > 0) {
            return "redirect:/selectMessagesByBlogId.action?blog_id=" + blog_id;
        }
        session.setAttribute("msg", "修改失败！");
        return "ModifyBlog";
    }

}
