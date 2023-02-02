package cn.byau.system.service;

import java.util.List;

import cn.byau.system.entity.Module;
import cn.byau.system.entity.User;

public interface UserService {
    //注册用户方法
    void register(User user);

    //根据用户名查询业务的方法
    User findByUserName(String username);

    //根据用户名查询所有角色
    User findRolesByUserName(String username);

    //根据角色id查询权限集合
    List<Module> findPermsByRoleId(int id);
    public int update(User user);
    public  List<Module> loadData(List<Module> ps);
	
}
