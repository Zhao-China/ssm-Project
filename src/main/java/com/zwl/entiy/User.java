package com.zwl.entiy;

import java.io.Serializable;

/**
 * 用户实体类
 * 
 * @author ZhaoWeiLong
 *
 */
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private String username;
	private String password;
	private Integer isEnabled;

	public User() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(Integer isEnabled) {
		this.isEnabled = isEnabled;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", isEnabled=" + isEnabled
				+ "]";
	}

}
