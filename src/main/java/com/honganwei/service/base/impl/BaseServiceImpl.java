package com.honganwei.service.base.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.honganwei.mapper.base.mapper.SysMapper;
import com.honganwei.service.base.BaseService;



public abstract class BaseServiceImpl<T> implements BaseService<T> {

    @Autowired
    private SysMapper<T> sysMapper;
    
    //传统写法，Spring4以下版本
//    public abstract SysMapper<T> getSysMapper();

    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#queryById(java.lang.Object)
	 */
    @Override
	public T queryById(Object id) {
        return this.sysMapper.selectByPrimaryKey(id);
    }
    
    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#queryListByWhere(T)
	 */
    @Override
	public List<T> queryListByWhere(T t) {
        return this.sysMapper.select(t);
    }

    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#queryByWhere(T)
	 */
    @Override
	public T queryByWhere(T t) {
        List<T> list = queryListByWhere(t);
        if (list != null && !list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#queryAll()
	 */
    @Override
	public List<T> queryAll() {
        return this.sysMapper.select(null);
    }

    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#save(T)
	 */
    @Override
	public void save(T t) {
        this.sysMapper.insert(t);
    }

    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#saveSelective(T)
	 */
    @Override
	public void saveSelective(T t) {
        this.sysMapper.insertSelective(t);
    }

    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#deleteById(java.lang.Object)
	 */
    @Override
	public Integer deleteById(Object id) {
        return this.sysMapper.deleteByPrimaryKey(id);
    }

    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#deleteByIds(java.lang.Object[])
	 */
    @Override
	public Integer deleteByIds(Object[] ids) {
        return this.sysMapper.deleteByIDS(ids);
    }

    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#deleteByWhere(T)
	 */
    @Override
	public Integer deleteByWhere(T t) {
        return this.sysMapper.delete(t);
    }

    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#update(T)
	 */
    @Override
	public Integer update(T t) {
        return this.sysMapper.updateByPrimaryKey(t);
    }
    
    /* (non-Javadoc)
	 * @see com.honganwei.service.base.impl.BaseService#updateSelective(T)
	 */
    @Override
	public Integer updateSelective(T t) {
        return this.sysMapper.updateByPrimaryKeySelective(t);
    }

}
