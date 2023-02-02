package cn.byau.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.byau.system.entity.Module;
import cn.byau.system.entity.User;
import cn.byau.system.mapper.UserMapper;
import cn.byau.system.util.SaltUtils;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userDAO;


    @Override
    public List<Module> findPermsByRoleId(int id) {
        return userDAO.findPermsByRoleId(id);
    }

    @Override
    public User findRolesByUserName(String username) {
        return userDAO.findRolesByUserName(username);
    }

    @Override
    public User findByUserName(String username) {
        return userDAO.findByUserName2(username);
    }

    @Override
    public void register(User user) {
        //处理业务调用dao
        //1.生成随机盐
        String salt = SaltUtils.getSalt(8);
        //2.将随机盐保存到数据
        user.setSalt(salt);
        //3.明文密码进行md5 + salt + hash散列
        Md5Hash md5Hash = new Md5Hash(user.getPassword(),salt,1024);
        user.setPassword(md5Hash.toHex());
        userDAO.save(user);
    }
    public int update(User user){
		return userDAO.update(user);
	}
    
    public  List<Module> loadData(List<Module> ps) {
		List<Module> Modules = new ArrayList<Module>();

		Map<Integer, Module> ModuleMap = new HashMap<Integer, Module>();
		for (Module p : ps) {
			ModuleMap.put(p.getId(), p);
		}
		for (Module p : ps) {
			
			if (p.getpId() == 0) {
				Modules.add(p);
			} else {
				Module parent = ModuleMap.get(p.getpId());
				//System.out.println(parent);
				if (parent.getMenuList() == null) {
					parent.setMenuList(new ArrayList<>());
				}
				parent.getMenuList().add(p);
			}
		}
		//System.out.println(Modules.size());
		return Modules;
	}
}
