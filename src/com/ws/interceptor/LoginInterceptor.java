package com.ws.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ws.po.Admin;
import com.ws.po.User;
/**
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		String url = request.getRequestURI();
		if ((url.indexOf("/toIndex.action") >= 0)||
			(url.indexOf("/toLogin.action") >= 0) ||
			(url.indexOf("/Login.action") >= 0) ||
			(url.indexOf("/AdminLogin.action") >= 0) ||
			(url.indexOf("/toRegist.action") >= 0) ||
			(url.indexOf("/Regist.action") >= 0) ||
			(url.indexOf("/findUser.action") >= 0) ||
			(url.indexOf("/toAdminLogin.action") >= 0)) {
			return true;
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		Admin admin = (Admin) session.getAttribute("admin");
		if (user != null || admin != null) {
			return true;
		}
		request.setAttribute("msg", "您还没有登录，请先登录！");
		request.getRequestDispatcher("/toLogin.action").forward(request, response);
		return false;
	}
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	@Override
	public void afterCompletion(HttpServletRequest request, 
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
