package com.zwl.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zwl.entiy.Employee;

/**
 * 员工的Mapper接口
 * 
 * @author ZhaoWeiLong
 *
 */
@Repository
public interface EmployeeMapper {
	/**
	 * 分页功能 查询从index索引开始，row条的员工信息 无参时查询所有员工
	 * 
	 * @return
	 */
	List<Employee> queryPages(@Param("map")HashMap<String, Object> map,@Param("emp")Employee employee);

	/**
	 * 查询记录总数
	 * 
	 * @return
	 */
	int queryCount(Employee employee);

	/**
	 * 模糊查找功能 为空时查询所有员工
	 * 
	 * @param emp
	 * @return
	 */
	List<Employee> query(Employee employee);

	/**
	 * 根据Id查询员工
	 * 
	 * @param id
	 * @return
	 */
	Employee queryById(Integer id);

	/**
	 * 添加员工，放回主键id
	 * 
	 * @param emp
	 * @return
	 */
	int addEmp(Employee employee);

	/**
	 * 删除员工
	 * 
	 * @param id
	 * @return
	 */
	int delete(Integer id);

	/**
	 * 更新员工
	 * 
	 * @param emp
	 * @return
	 */
	int update(Employee employee);

}
