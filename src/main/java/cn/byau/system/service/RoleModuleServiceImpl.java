package cn.byau.system.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.byau.system.entity.Module;
import cn.byau.system.mapper.ModuleMapper;
import cn.byau.system.mapper.RoleModuleMapper;
import cn.byau.system.util.StringUtil;

@Service
public class RoleModuleServiceImpl implements RoleModuleService {
	@Autowired
	private ModuleMapper moduleMapper;
	@Autowired
	private RoleModuleMapper roleModuleMapper;
	
	@Override
	public List<Module> findModuleIdsByRoleId(int roleId) {
		return roleModuleMapper.findModuleIdsByRoleId(roleId);
	}

	@Override
	public void addRoleModuleRelation(int roleId, String moduleIds) {
		roleModuleMapper.deleteByRoleId(roleId);
		List<Integer> ids = StringUtil.getListFromStr(moduleIds);
		for (int moduleId : ids) {
			roleModuleMapper.addRoleModule(roleId, moduleId);
		}
	}
	
	@Override
    public List<Module> queryModuleList(int roleId) {
    	List<Module> menuList=moduleMapper.findAll();
  
    	
    	List<Module> partList= roleModuleMapper.findModuleIdsByRoleId(roleId);
    	Map<Integer, Module> ModuleMap = new HashMap<Integer, Module>();
    	for (Module p : menuList) {
    		ModuleMap.put(p.getId(), p);
    	}
    	for (Module p : partList) {
    		if(ModuleMap.get(p.getId())!=null) {
    			ModuleMap.get(p.getId()).setChecked(true);
    		}
    	}
    	//System.out.println(menuList);
    	return menuList;
    }
	
}
