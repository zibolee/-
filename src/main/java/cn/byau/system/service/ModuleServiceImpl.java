package cn.byau.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.byau.system.entity.Module;
import cn.byau.system.mapper.ModuleMapper;
import cn.byau.system.mapper.RoleModuleMapper;

@Service
public class ModuleServiceImpl implements ModuleService {
	
	@Autowired
	private ModuleMapper moduleMapper;
	
	@Autowired
	private RoleModuleMapper roleModuleMapper;
	
	
	

	@Override
	public List<Module> findAll() {
		return moduleMapper.findAll();
	}

	@Override
	public void add(Module module) {
		moduleMapper.addModule(module);
	}

	@Override
	public Module getById(int id) {
		return moduleMapper.getById(id);
	}

	@Override
	public void updateModule(Module module) {
		moduleMapper.updateModule(module);
	}

	@Override
	public void delModule(Module module) {
		moduleMapper.delModule(module);
	}

	@Override
	public List<Module> findByModuleIds(List<Integer> ids) {
		return moduleMapper.findByModuleIds(ids);
	}

	@Override
	public List<Module> findByRoleId(int roleId) {
		return moduleMapper.findByRoleId(roleId);
	}
	
	public List<Module> findMenusByUserId(int userId){
		return moduleMapper.findMenusByUserId(userId);
	}
	
	
	
	 
	
}
