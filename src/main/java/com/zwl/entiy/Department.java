package com.zwl.entiy;

import java.io.Serializable;

/**
 * 部门实体类
 * 
 * @author ZhaoWeiLong
 *
 */
public class Department implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String departmentName;

	public Department() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Department [id=" + id + ", departmentName=" + departmentName + "]";
	}

}
