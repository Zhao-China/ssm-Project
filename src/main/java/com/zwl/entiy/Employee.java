package com.zwl.entiy;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 员工实体类
 * 
 * @author ZhaoWeiLong
 *
 */
public class Employee implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String lastName;
	private String email;
	private Integer gender;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private Department dept;

	public Employee() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", lastName=" + lastName + ", email=" + email + ", gender=" + gender + ", birth="
				+ birth + ", dept=" + dept + "]";
	}


}
