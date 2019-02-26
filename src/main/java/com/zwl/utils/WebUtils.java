package com.zwl.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Set;

import com.zwl.entiy.Department;
import com.zwl.entiy.Employee;

public class WebUtils {

	/**
	 * 解决点击下一页携带查询条件的问题
	 * 
	 * @param queryParams 封装了查询条件的集合
	 * @param prefix      查询的前缀字符串，若没有，传null
	 * @return 返回的处理后的查询字符串
	 */
	public static String parseQueryString(Employee employee) {

		String lastName = employee.getLastName();
		String email = employee.getEmail();
		Integer gender = employee.getGender();
		Department dept = employee.getDept();
		Date birth = employee.getBirth();

		StringBuilder sb = new StringBuilder();
		sb.append("&1=1");
		if (lastName != null && !lastName.toString().trim().equals("")) {
			sb.append("&").append("lastName").append("=").append(lastName);
		}
		if (email != null && !email.toString().trim().equals("")) {
			sb.append("&").append("email").append("=").append(email);
		}
		if (gender != null && !gender.toString().trim().equals("")) {
			sb.append("&").append("gender").append("=").append(gender);
		}
		if (dept != null && !dept.getDepartmentName().toString().trim().equals("")) {
			sb.append("&").append("dept.departmentName").append("=").append(dept.getDepartmentName());
		}
		if (birth != null) {
			sb.append("&").append("birth").append("=").append(birth);
		}
		return sb.toString();
	}

}
