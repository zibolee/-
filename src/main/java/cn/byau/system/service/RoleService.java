package cn.byau.system.service;

import java.util.List;

import cn.byau.system.entity.Role;

/**
 * 
 * @author xiesg
 *
 */
public interface RoleService {

	/**
	 * 
	 * @return
	 */
	public List<Role> getAllRole();
	public Role selectRoleById(int roleid);
	public int insertRole(Role role);
	public int updateRole(Role role);
	public int deleteRoleById(int roleId);
	 public void deleteRoleById2(int roleId);
}
