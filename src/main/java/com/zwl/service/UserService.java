package com.zwl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zwl.entiy.FileCommon;
import com.zwl.entiy.Page;
import com.zwl.entiy.User;
import com.zwl.mapper.UserMapper;
import com.zwl.utils.GlobalValues;

/**
 * 用户服务层
 * 
 * @author ZhaoWeiLong
 *
 */
@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;

	/**
	 * 添加用户
	 * 
	 * @param user
	 * @return
	 */
	public Boolean addUser(User user) {
		int i = userMapper.addUser(user);
		return i > 0 ? true : false;
	}

	/**
	 * 删除用户
	 * 
	 * @param id
	 * @return
	 */
	public Boolean deleteUser(Integer id) {
		int i = userMapper.deleteUser(id);
		return i > 0 ? true : false;
	}

	/**
	 * 查询用户
	 * 
	 * @param id
	 * @return
	 */
	public User queryUser(User user) {
		User u = userMapper.queryUser(user);
		return u;
	}

	/**
	 * 根据id查询用户
	 * 
	 * @param id
	 * @return
	 */
	public User queryById(Integer id) {
		User user = userMapper.queryById(id);
		return user;
	}

	/**
	 * 更新密码
	 * 
	 * @param user
	 * @return
	 */
	public int updatePswd(User user) {
		return userMapper.updatePswd(user);
	}

	/**
	 * 分页查询
	 * 
	 * @param curPage
	 * @param map
	 * @return
	 */
	public Page<User> queryPages(String curPage, Map<String, Object> map) {

		// 获得总记录数
		int totalrows = userMapper.queryCount();

		// 每页显示多少条数据
		int pageSize = GlobalValues.PAGE_SMALL;

		// 获得page对象
		Page<User> page = new Page<User>(curPage, totalrows, pageSize);

		// 获得起始索引
		int index = (page.getCurPage() - 1) * pageSize;
		map.put("index", index);
		map.put("pageSize", pageSize);
		List<User> list = userMapper.queryPages(map);
		page.setList(list);
		
		return page;
	}

}
