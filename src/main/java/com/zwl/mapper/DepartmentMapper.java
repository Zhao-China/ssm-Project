package com.zwl.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.zwl.entiy.Department;

@Repository
public interface DepartmentMapper {

	// 查询所有部门
	@Select("select * from t_department")
	public List<Department> queryAllDept();

}
