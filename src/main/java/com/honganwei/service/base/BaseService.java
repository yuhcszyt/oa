package com.honganwei.service.base;

import java.util.List;

public interface BaseService<T> {

	/**
	 * 根据主键查询数据
	 * 
	 * @param id
	 * @return
	 */
	T queryById(Object id);

	/**
	 * 根据条件查询，多条件之间是 and 关系
	 * 
	 * @param t
	 * @return
	 */
	List<T> queryListByWhere(T t);

	/**
	 * 根据条件查询单条数据
	 * 
	 * @param t
	 * @return
	 */
	T queryByWhere(T t);

	/**
	 * 查询所有数据
	 * 
	 * @return
	 */
	List<T> queryAll();

	/**
	 * 新增数据，使用全部字段
	 * 
	 * @param t
	 */
	void save(T t);

	/**
	 * 新增数据，使用不为null的字段
	 * 
	 * @param t
	 */
	void saveSelective(T t);

	/**
	 * 根据id删除
	 * 
	 * @param id
	 * @return
	 */
	Integer deleteById(Object id);

	/**
	 * 根据ids删除
	 * 
	 * @param ids
	 * @return
	 */
	Integer deleteByIds(Object[] ids);

	/**
	 * 根据条件删除
	 * 
	 * @param t
	 */
	Integer deleteByWhere(T t);

	/**
	 * 根据主键id更新数据
	 * 
	 * @param t
	 */
	Integer update(T t);

	/**
	 * 根据主键id更新数据
	 * 
	 * @param t
	 */
	Integer updateSelective(T t);

}