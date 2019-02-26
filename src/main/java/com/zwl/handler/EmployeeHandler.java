package com.zwl.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zwl.entiy.Department;
import com.zwl.entiy.Employee;
import com.zwl.entiy.Page;
import com.zwl.service.DepartmentService;
import com.zwl.service.EmployeeService;
import com.zwl.utils.WebUtils;

/**
 * 处理员工信息相关请求
 * 
 * @author 37424
 *
 */
@Controller
public class EmployeeHandler {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private DepartmentService departmentService;

	/**
	 * 分页显示员工数据，支持模糊查询
	 * 
	 * @param curPage 当前页
	 * @param map		隐含map
	 * @param employee	查询对象
	 * @return
	 */
	@RequestMapping(value = "/emps", method = { RequestMethod.GET, RequestMethod.POST })
	public String toList(@RequestParam(value = "curPage", required = false, defaultValue = "1") String curPage,
			Map<String, Object> map, Employee employee) {
		// 存放分页显示的相关参数
		HashMap<String, Object> params = new HashMap<String, Object>();

		// 模糊查询的相关参数
		String queryString = WebUtils.parseQueryString(employee);

		// 查询分页结果
		Page<Employee> page = employeeService.queryPages(params, curPage, employee);
		map.put("queryString", queryString);
		map.put("page", page);
		return "list";
	}

	// 前往添加员工页面
	@RequestMapping(value = "/emp", method = RequestMethod.GET)
	public String toAddEmp(Map<String, Object> map) {
		//回显部门信息
		List<Department> allDept = departmentService.queryAllDept();
		map.put("allDept", allDept);
		return "add";
	}

	// 添加员工
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	public String addEmp(Employee employee) {
		employeeService.addEmp(employee);
		return "redirect:/emps";
	}

	// 前往修改员工界面
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
	public String toEditEmp(@PathVariable("id") Integer id, Map<String, Object> map) {
		Employee employee = employeeService.queryById(id);
		map.put("emp", employee);
		// 回显部门和性别
		HashMap<Integer, Object> genderMap = new HashMap<Integer, Object>();
		genderMap.put(1, "男");
		genderMap.put(0, "女");

		map.put("genderMap", genderMap);

		List<Department> allDept = departmentService.queryAllDept();
		map.put("allDept", allDept);

		return "edit";
	}

	// 修改员工
	@RequestMapping(value = "/emp", method = RequestMethod.PUT)
	public String editEmp(Employee employee) {
		employeeService.update(employee);
		return "redirect:/emps";
	}

	// 删除员工
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
	public String deleteEmp(@PathVariable("id") Integer id) {
		employeeService.delete(id);
		return "redirect:/emps";
	}

}
