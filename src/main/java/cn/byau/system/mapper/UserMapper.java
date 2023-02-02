package cn.byau.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.byau.system.entity.Module;
import cn.byau.system.entity.User;

@Mapper
public interface UserMapper {

    void save(User user);

    User findByUserName2(String username);


    //根据用户名查询所有角色
    User findRolesByUserName(String username);

    //根据角色id查询权限集合
    List<Module> findPermsByRoleId( int id);
    
    int update(User user);
}

