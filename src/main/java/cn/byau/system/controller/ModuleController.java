package cn.byau.system.controller;

import java.util.List;

import javax.servlet.http.HttpSession;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.byau.system.entity.Module;
import cn.byau.system.service.ModuleService;
import cn.byau.system.service.RoleModuleService;

@Controller
@RequestMapping("/system/module")
public class ModuleController {
	
	@Autowired
	private ModuleService moduleService;
	
	@RequestMapping("/list")
	@ResponseBody
	public List<Module> getList(Model model) {
		List<Module> list = moduleService.findAll();

		return list;
	}
	
	@RequestMapping("/add")
	public String addModule(Module module, Model model) {
		
		moduleService.add(module);
		return "redirect:toList";
	}
	
	
	
	@RequestMapping("/getModule")
	@ResponseBody
	public Module getModule(int id, Model model) {
		Module module = moduleService.getById(id);
		return module;
	}

	
	@RequestMapping("/update")
	public String update(Module module, Model model) {
		//System.out.println("targt="+module.getTarget());
		moduleService.updateModule(module);
		return "redirect:toList";
	}
	
	@RequestMapping("/del")
	public String del(Module module, Model model) {
		moduleService.delModule(module);
		return "redirect:toList";
	}
	

	
	@RequestMapping("/toList")
	public String toModuleManagePage() {
		return "system/module/list.jsp";
	}
	
}
