package com.zwl.entiy;

import java.util.Date;

public class FileCommon {

	private Integer id;
	private String fileName;// 文件名
	private String fileContent;// 文件内容
	private String filePath;// 文件的绝对路径
	private String creater;// 创建人
	private Date createdTime;// 创建时间

	public FileCommon() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileContent() {
		return fileContent;
	}

	public void setFileContent(String fileContent) {
		this.fileContent = fileContent;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	@Override
	public String toString() {
		return "FileCommon [id=" + id + ", fileName=" + fileName + ", fileContent=" + fileContent + ", filePath="
				+ filePath + ", creater=" + creater + ", createdTime=" + createdTime + "]";
	}

}
