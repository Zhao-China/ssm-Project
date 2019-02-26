package com.zwl.entiy;

import java.util.List;

public class Page<T> {

	/**
	 * 总页数
	 */
	private int totalPages;

	/**
	 * 每页显示多少条数据
	 */
	private int pageSize;

	/**
	 * 总记录数
	 */
	private int totalrows;

	/**
	 * 当前页
	 */
	private int curPage;

	private List<T> list;

	/**
	 * 传递当前页和总记录数获得总页数
	 * 
	 * @param curPage
	 * @param totalrows
	 */
	public Page(String curPage, int totalrows, int pageSize) {
		this.totalrows = totalrows;// 总记录数
		this.pageSize = pageSize;// 每天显示的总条数

		// 计算总页数
		this.totalPages = this.totalrows / this.pageSize + (this.totalrows % this.pageSize == 0 ? 0 : 1);

		this.curPage = 1;
		try {
			this.curPage = Integer.parseInt(curPage);
		} catch (Exception e) {

		}

		if (this.curPage > this.totalPages) {
			this.curPage = this.totalPages;
		}

		if (this.curPage < 1) {
			this.curPage = 1;
		}
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getTotalrows() {
		return totalrows;
	}

	public int getCurPage() {
		return curPage;
	}

	/**
	 * .是否有上一页
	 * 
	 * @return
	 */
	public boolean isHasPrev() {
		return this.curPage > 1;
	}

	/**
	 * .是否有下一页
	 * 
	 * @return
	 */
	public boolean isHasNext() {
		return this.curPage < this.totalPages;
	}

	/**
	 * .返回上一页的页码
	 * 
	 * @return
	 */
	public int getPrev() {
		if (isHasPrev()) {
			return this.curPage - 1;
		}
		return this.curPage;
	}

	/**
	 * .返回下一页的页码
	 * 
	 * @return
	 */
	public int getNext() {
		if (isHasNext()) {
			return this.curPage + 1;
		}
		return this.curPage;
	}

}
