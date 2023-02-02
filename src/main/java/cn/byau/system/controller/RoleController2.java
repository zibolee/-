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
@RequestMapping("/system/role2")
public class RoleController2 {

	@Autowired
	private RoleService roleService;
	
	
	
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private RoleModuleService roleModuleService;
	
	
	
		
	
    
    
    @RequestMapping("/list")
    //@ResponseBody
    public String list2(Role role,HttpServletRequest request)
    {
       
        List<Role> list = roleService.getAllRole();
        request.setAttribute("list",list);  
        return "system/role2/list.jsp";
    }
	


	@RequestMapping("/toAdd")
    public String toAdd(HttpServletRequest request)
    
    {
    	request.setAttribute("list", moduleService.findAll());
        return "system/role2/add.jsp";
    }
	
	@RequestMapping("/add")
	
	@ResponseBody
    public Object add(String roleName,String[] moduleId)
    {
    	
		StringBuilder builder=new StringBuilder();
        for (int i = 0; i < moduleId.length; i++) {
			if(i==0) {
				builder.append(moduleId[i]);
			}
			else {
				builder.append(",").append(moduleId[i]);
			}
		}
		
		Role role=new Role();
    	role.setRoleName(roleName);
        roleService.insertRole(role);
        roleModuleService.addRoleModuleRelation(role.getRoleId(), builder.toString());
        
        Result2 result = new Result2();
		result.setMsg("OK");
		return result;
    }
    
	

    @RequestMapping("/toUpdate")
        public String toEdit2(@RequestParam("roleId") int roleId, ModelMap mmap)
    {
    	 
    	
    	Role role = roleService.selectRoleById(roleId);
        mmap.put("role", role);

        //list为所有权限
        List<Module> list = moduleService.findAll();
        mmap.put("list1", list);
        
        
         //rolemoduleList为当前角色的权限
        List<Module> rolemoduleList=
        		roleModuleService.findModuleIdsByRoleId(roleId);
//        String rp1="";
//        for(Module rp:rolemoduleList) {
//        	rp1=rp1+rp.getId();
//        }
//        System.out.println("rp1="+rp1);
  
        mmap.put("list2", rolemoduleList);
        
        return "system/role2/update.jsp";
    }
    
    
    
@RequestMapping("/update")
	
	@ResponseBody
    public Object update(Role role,String[] moduleId)
    {
    	
		StringBuilder builder=new StringBuilder();
        for (int i = 0; i < moduleId.length; i++) {
			if(i==0) {
				builder.append(moduleId[i]);
			}
			else {
				builder.append(",").append(moduleId[i]);
			}
		}
		
		
        roleService.updateRole(role);
        roleService.deleteRoleById2(role.getRoleId());
        
        
        roleModuleService.addRoleModuleRelation(role.getRoleId(), builder.toString());
        
        Result2 result = new Result2();
		result.setMsg("OK");
		return result;
    }
    
    @RequestMapping( "/delete")
    @ResponseBody
    public Object delete(@RequestParam("roleId") int roleId)
    {
        return roleService.deleteRoleById(roleId);
    }

}
