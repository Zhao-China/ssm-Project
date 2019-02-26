package com.zwl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zwl.entiy.FileCommon;
import com.zwl.entiy.Page;
import com.zwl.mapper.FileCommonMapper;
import com.zwl.utils.GlobalValues;

@Service
public class FileCommonService {

	@Autowired
	private FileCommonMapper fileCommonMapper;

	/**
	 * 分页查询
	 * 
	 * @param map
	 * @return
	 */
	public Page<FileCommon> queryPages(Map<String, Object> map, String curPage) {

		// 获得总记录数
		int totalrows = fileCommonMapper.queryCount();

		// 每页显示多少条数据
		int pageSize = GlobalValues.PAGE_SMALL;

		// 获得page对象
		Page<FileCommon> page = new Page<FileCommon>(curPage, totalrows, pageSize);

		// 获得起始索引
		int index = (page.getCurPage() - 1) * pageSize;
		map.put("index", index);
		map.put("pageSize", pageSize);
		List<FileCommon> list = fileCommonMapper.queryPages(map);
		page.setList(list);
		
		return page;
	}
	
	public int addFileCommon(FileCommon fileCommon) {
		
		return fileCommonMapper.addFileCommon(fileCommon);
		
	}

	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public int delete(Integer id) {
		return fileCommonMapper.delete(id);
	}

	public FileCommon queryById(Integer id) {
		return fileCommonMapper.queryById(id);
	}

}
