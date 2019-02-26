package com.zwl.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Service;

import com.zwl.entiy.Employee;
import com.zwl.entiy.Page;
import com.zwl.mapper.EmployeeMapper;
import com.zwl.utils.GlobalValues;

/**
 * 员工服务层
 * 
 * @author ZhaoWeiLong
 *
 */
@Service
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;

	/**
	 * 分页功能
	 * 
	 * @return
	 */
	public Page<Employee> queryPages(HashMap<String, Object> params, String curPage,Employee employee) {
		// 获得总记录数
		int totalrows = employeeMapper.queryCount(employee);
		// 每页显示的数据条数
		int pageSize = GlobalValues.PAGE_SMALL;
		// 创建page对象
		Page<Employee> page = new Page<Employee>(curPage, totalrows, pageSize);
		// 获得起始索引
		int index = (page.getCurPage() - 1) * pageSize;
		params.put("index", index);
		params.put("pageSize", pageSize);
		// 根据条件查询员工信息
		List<Employee> list = employeeMapper.queryPages(params,employee);
		page.setList(list);
		return page;

	}

	/**
	 * 模糊查找功能 为空时查询所有员工
	 * 
	 * @param emp
	 * @return
	 */
	public List<Employee> query(Employee emp) {
		List<Employee> list = employeeMapper.query(emp);
		return list;
	}

	/**
	 * 添加员工，放回主键id
	 * 
	 * @param emp
	 * @return
	 */
	public Boolean addEmp(Employee emp) {
		int i = employeeMapper.addEmp(emp);
		return i > 0 ? true : false;
	}

	/**
	 * 删除员工
	 * 
	 * @param id
	 * @return
	 */
	public boolean delete(Integer id) {
		int i = employeeMapper.delete(id);
		return i > 0 ? true : false;
	}

	/**
	 * 更新员工
	 * 
	 * @param emp
	 * @return
	 */
	public boolean update(Employee emp) {
		int i = employeeMapper.update(emp);
		return i > 0 ? true : false;
	}

	/**
	 * 查询指定ID的员工
	 * 
	 * @param id
	 * @return
	 */
	public Employee queryById(Integer id) {
		return employeeMapper.queryById(id);
	}

}
