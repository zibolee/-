package cn.byau.system.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.byau.system.entity.Module;
import cn.byau.system.entity.Role;
import cn.byau.system.service.ModuleService;
import cn.byau.system.service.RoleModuleService;
import cn.byau.system.service.RoleService;
import cn.byau.system.util.Result2;



@Controller
@RequestMapping("/system/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	
//	@Autowired
//	private ModuleService moduleService;
//	@Autowired
//	private RoleModuleService roleModuleService;
		
	@RequestMapping("/list")
    public String list(Role role,HttpServletRequest request)
    {
        System.out.println("listtest");
        List<Role> list = roleService.getAllRole();
        request.setAttribute("list",list);  
        return "system/role/list.jsp";
    }
	@RequestMapping("/toAdd")
    public String add(HttpServletRequest request)
    {
        return "system/role/add.jsp";
    }

    @RequestMapping("/toUpdate")
        public String toUpdate(@RequestParam("roleId") int roleId, ModelMap mmap)
    {
    	Role role = roleService.selectRoleById(roleId);
        mmap.put("role", role);
        return "system/role/update.jsp";
    }
    
    @RequestMapping( "/delete")
    @ResponseBody
    public Object delete(@RequestParam("roleId") int roleId)
    {
        return roleService.deleteRoleById(roleId);
    }
}
