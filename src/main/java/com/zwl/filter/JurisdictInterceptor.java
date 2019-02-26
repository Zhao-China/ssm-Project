package com.zwl.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zwl.utils.GlobalValues;

/**
 * 自定义拦截器，对url地址访问进行过滤
 * 
 * @author 37424
 *
 */
public class JurisdictInterceptor implements HandlerInterceptor {

	private static Long start;
	private static Long end;
	
	
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 判断用户是否登录，
		String path = request.getServletPath();
		// 判断是否需要验证session
		if (GlobalValues.RESOURCE_SET.contains(path)) {
			Object obj = request.getSession().getAttribute(GlobalValues.LOGIN_USER);
			if (obj != null) {
				// 已登录，放行
				return true;
			} else {
				// 未登录，重定向到登录页面
				response.sendRedirect(request.getContextPath() + "/index.jsp");
				return false;
			}
		} else {
			return true;
		}
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		 start=System.currentTimeMillis();
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		end=System.currentTimeMillis();
		System.out.println("响应时间："+(end-start)+"ms");
	}

}
