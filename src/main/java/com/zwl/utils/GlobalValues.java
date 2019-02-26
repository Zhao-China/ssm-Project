package com.zwl.utils;

import java.util.HashSet;
import java.util.Set;

public class GlobalValues {
	
	/**
	 * .用户登录成功之后放入session中的键
	 */
	public static final String LOGIN_USER = "loginUser";
	
	/**
	 * .需要用户登录才能访问的资源
	 */
	public static final Set<String> RESOURCE_SET = new HashSet<String>();
	
	static {
		RESOURCE_SET.add("/emps");
		RESOURCE_SET.add("/emp");
		RESOURCE_SET.add("/user");
		RESOURCE_SET.add("/users");
		RESOURCE_SET.add("/Dwonload");
		RESOURCE_SET.add("/Upload");
		RESOURCE_SET.add("/toDwonload");
		RESOURCE_SET.add("/toUpload");
		RESOURCE_SET.add("/deleteFile");
		RESOURCE_SET.add("/toChangePswd");
	}
	public static final int PAGE_SMALL=5;
	public static final int PAGE_BIG=50;
}
