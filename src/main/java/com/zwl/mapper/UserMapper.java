package com.zwl.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.zwl.entiy.User;
@Repository
public interface UserMapper {
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	int addUser(User user);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	int deleteUser(Integer id);
	
	/**
	 * 查询用户
	 * @param id
	 * @return
	 */
	User queryUser(User user);

	/**
	 * 根据id查询用户
	 * @param id
	 * @return
	 */
	User queryById(@Param("id") Integer id);

	
	/**
	 * 更新密码
	 * @return
	 */
	int updatePswd(User user);

	@Select("select count(*) from t_user")
	int queryCount();

	@Select("select * from t_user limit #{index},#{pageSize}")
	List<User> queryPages(Map<String, Object> map);
	
}
