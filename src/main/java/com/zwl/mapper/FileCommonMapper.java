package com.zwl.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.zwl.entiy.FileCommon;

@Repository
public interface FileCommonMapper {

	/**
	 * 分页查询
	 * 
	 * @param map
	 * @return
	 */
	List<FileCommon> queryPages(Map<String, Object> map);

	/**
	 * 查询总记录数
	 * 
	 * @return
	 */
	int queryCount();

	/**
	 * 添加
	 * 
	 * @param fileCommon
	 * @return
	 */
	int addFileCommon(FileCommon fileCommon);

	/**
	 * 删除文件
	 * 
	 * @param id
	 * @return
	 */
	@Delete("delete from t_file_common where id=#{id} ")
	int delete(Integer id);

	/**
	 * 根据Id查询
	 * 
	 * @param id
	 * @return
	 */
	@Select("select * from t_file_common where id=#{id}")
	FileCommon queryById(Integer id);
}
