package cn.byau.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.byau.system.entity.Role;
import cn.byau.system.mapper.RoleMapper;
import cn.byau.system.mapper.RoleModuleMapper;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private RoleModuleMapper roleModuleMapper;
	
	@Override
	public List<Role> getAllRole() {
		return roleMapper.getAllRole();
	}
	public Role selectRoleById(int roleid) {
		return roleMapper.selectRoleById(roleid);
	}
	public int insertRole(Role role)
    {
        return roleMapper.insertRole(role);
    }
	 public int updateRole(Role role)
	    {
	        return roleMapper.updateRole(role);
	    }
	 public int deleteRoleById(int roleId)
	    {
		 roleModuleMapper.deleteByRoleId(roleId);
		 return roleMapper.deleteRoleById(roleId);
	        
	        //return roleMapper.deleteRoleById(roleId);
	    }
	 
	 public void deleteRoleById2(int roleId)
	    {
		 roleModuleMapper.deleteByRoleId(roleId);
		    
	        //return roleMapper.deleteRoleById(roleId);
	    }
}
