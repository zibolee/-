package cn.byau.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.byau.system.entity.Role;
@Mapper
public interface RoleMapper {

	/**
	 * 获取所有角色列表
	 * @return
	 */
	public List<Role> getAllRole();
	public Role selectRoleById(int roleid);
	 public int insertRole(Role role);
	 public int updateRole(Role role);
	 public int deleteRoleById(int roleId);
	
}
