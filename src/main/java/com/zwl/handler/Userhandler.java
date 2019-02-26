package com.zwl.handler;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zwl.entiy.Page;
import com.zwl.entiy.User;
import com.zwl.service.UserService;
import com.zwl.utils.GlobalValues;

/**
 * 处理用户相关请求
 * 
 * @author 37424
 *
 */
@Controller
public class Userhandler {

	@Autowired
	private UserService userService;

	// 验证
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, Map<String, Object> map, HttpSession session) {
		// 判断用户名和密码，设置session，重定向到到list界面
		User user2 = userService.queryUser(user);
		if (user2 != null) {
			session.setAttribute(GlobalValues.LOGIN_USER, user2);
			return "redirect:/emps";
		} else {
			map.put("message", "用户名或密码不正确!");
			return "forward:/index.jsp";
		}
	}

	// 验证用户名是否存在
	@ResponseBody
	@RequestMapping(value = "/checkUser", method = RequestMethod.POST)
	public String checkUser(User user) {
		User u = userService.queryUser(user);
		if (u != null) {
			return "false";
		}
		return "true";
	}

	// 验证密码
	@ResponseBody
	@RequestMapping(value = "/checkPswd", method = RequestMethod.POST)
	public String checkPswd(User user, HttpSession session) {
		User user2 = (User) session.getAttribute("loginUser");
		if (!user2.getPassword().equals(user.getPassword())) {
			return "false";
		}
		return "true";
	}

	// 注销用户
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 销毁session，重定向到登录页面
		session.invalidate();
		return "redirect:/index.jsp";
	}

	// 修改密码
	@RequestMapping(value = "/changePswd", method = RequestMethod.PUT)
	public String changePswd(User user) {
		userService.updatePswd(user);
		return null;
	}

	// 前往修改密码界面
	@RequestMapping(value = "/toChangePswd", method = RequestMethod.GET)
	public String toChangePswd() {
		return "changePassword";
	}

	// 前往账号管理页面
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String toAccountManager(
			@RequestParam(value = "curPage", required = false, defaultValue = "1") String curPage,
			Map<String, Object> map, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		if (user.getIsEnabled() == 1) {
			return "redirect:/emps";
		} else {
			Page<User> page = userService.queryPages(curPage, map);
			map.put("page", page);
			return "accountManager";
		}

	}

	// 前往账号添加页面
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String toAddUser() {
		return "addUser";
	}

	// 添加用户
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String regist(User user, HttpSession session, Map<String, Object> map) {
		Boolean b = userService.addUser(user);
		if (b) {
			if (session.getAttribute("loginUser") == null) {
				session.setAttribute(GlobalValues.LOGIN_USER, user);
			}
			return "redirect:/emps";
		}
		map.put("message", "注册失败，请稍后重试!");
		return "forward:/regist.jsp";
	}

	// 删除
	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable(value="id") Integer id, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		if (user.getIsEnabled() == 1) {
			return "redirect:/emps";
		}
		userService.deleteUser(id);
		return "redirect:/users";
	}
}
