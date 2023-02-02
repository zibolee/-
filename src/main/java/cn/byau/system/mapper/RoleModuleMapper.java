package cn.byau.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import cn.byau.system.entity.Module;
@Mapper
public interface RoleModuleMapper {

	/**
	 * 根据角色id获取该角色拥有的所有菜单权限
	 * @param roleId 角色权限
	 * @return
	 */
	public List<Module> findModuleIdsByRoleId(int roleId);
	
	/**
	 * 根据角色id删除该角色下的所有模块
	 * @param roleId
	 */
	public void deleteByRoleId(int roleId);
	
	/**
	 * 
	 * @param roleId
	 * @param moduleId
	 */
	public void addRoleModule(@Param("roleId")int roleId, @Param("moduleId")int moduleId);
	
}
