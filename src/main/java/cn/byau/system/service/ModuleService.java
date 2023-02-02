package cn.byau.system.service;

import java.util.List;

import cn.byau.system.entity.Module;

/**
 * 模块管理业务层
 * @author xsg
 *
 */
public interface ModuleService {
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<Module> findAll();
	
	/**
	 * 添加一条数据
	 * @param module
	 */
	public void add(Module module);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public Module getById(int id);
	
	/**
	 * 修改
	 * @param module
	 */
	public void updateModule(Module module);
	
	/**
	 * 
	 * @param module
	 */
	public void delModule(Module module);
	
	/**
	 * 
	 * @param ids
	 * @return
	 */
	public List<Module> findByModuleIds(List<Integer> ids);
	
	/**
	 * 
	 * @param roleId
	 * @return
	 */
	public List<Module> findByRoleId(int roleId);
	
	public List<Module> findMenusByUserId(int userId);
	
	
	//public List<Module> queryModuleList(int roleId);
}
