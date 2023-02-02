package cn.byau.system.service;

import java.util.List;

import cn.byau.system.entity.Module;

public interface RoleModuleService {

	/**
	 * 
	 * @param roleId
	 * @return
	 */
	public List<Module> findModuleIdsByRoleId(int roleId);
	
	/**
	 * 
	 * @param roleId
	 * @param moduleIds
	 */
	public void addRoleModuleRelation(int roleId, String moduleIds);
	public List<Module> queryModuleList(int roleId);
}
