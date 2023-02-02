package cn.byau.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import cn.byau.system.entity.Module;

@Mapper
public interface ModuleMapper {
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<Module> findAll();
	
	/**
	 * 添加一条数据
	 * @param module
	 */
	public void addModule(Module module);
	
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
	public List<Module> findByModuleIds(@Param("ids")List<Integer> ids);
	
	/**
	 * 
	 * @param roleId
	 * @return
	 */
	public List<Module> findByRoleId(int roleId);
	
	public List<Module> findMenusByUserId(int userId);
	

	
}
