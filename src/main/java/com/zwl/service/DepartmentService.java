package com.zwl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zwl.entiy.Department;
import com.zwl.mapper.DepartmentMapper;

@Service
public class DepartmentService {
	@Autowired
	private DepartmentMapper departmentMapper;

	public List<Department> queryAllDept() {

		return departmentMapper.queryAllDept();
	}

}
