package cn.byau.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.byau.system.entity.Module;
import cn.byau.system.entity.Role;
import cn.byau.system.service.RoleModuleService;
import cn.byau.system.service.RoleService;

@Controller
@RequestMapping("/system/rolemodule")
public class RoleModuleController {

	@Autowired
	private RoleModuleService roleModuleService;
	@Autowired
	private RoleService roleService;

	@RequestMapping("/getModuleIdsByRoleId")
	@ResponseBody
	public List<Module> getModuleIdsByRoleId(Integer roleId) {
		
		List<Module> moduleIds = roleModuleService.queryModuleList(roleId);
		return moduleIds;
	}

	@RequestMapping("/addRoleModuleRelation")
	public String addRoleModuleRelation(
			String roleName, String moduleIds) {
		Role role = new Role();
		role.setRoleName(roleName);
		roleService.insertRole(role);
		roleModuleService.addRoleModuleRelation(role.getRoleId(), moduleIds);
		return "redirect:/system/role/list";
	}
	@RequestMapping("/updateRoleModuleRelation")
	public String updateRoleModuleRelation(Role role, String moduleIds) {
		roleService.updateRole(role);
		roleModuleService.addRoleModuleRelation(role.getRoleId(), moduleIds);
		return "redirect:/system/role/list";
	}

}
