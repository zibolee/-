package cn.byau.system.realms;

import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import cn.byau.system.entity.Module;
import cn.byau.system.entity.Role;
import cn.byau.system.entity.User;
import cn.byau.system.service.UserService;


//自定义realm
public class CustomerRealm extends AuthorizingRealm {
	 @Autowired
private	 UserService userService;
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //获取身份信息
        User user1 = (User) principals.getPrimaryPrincipal();
        //System.out.println("调用授权验证: "+primaryPrincipal);
      
        User user = userService.findRolesByUserName(user1.getUsername());
        //授权角色信息
        System.out.println("userfdffffffffffffffffff"+user);
        List<Role> roles=user.getRoles();
        if(!CollectionUtils.isEmpty(roles)){
            SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
               for(Role role:roles) {
                simpleAuthorizationInfo.addRole(role.getRoleName());
               
                //权限信息
                List<Module> perms = userService.findPermsByRoleId(role.getRoleId());
                if(!CollectionUtils.isEmpty(perms)){
                  for(Module perm:perms) {
                        simpleAuthorizationInfo.addStringPermission(perm.getPerms());
                    }
                }
            }
            System.out.println(simpleAuthorizationInfo.getStringPermissions());
            return simpleAuthorizationInfo;
        }
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("==========================");
        String principal = (String) token.getPrincipal();
        //在工厂中获取service对象
        //UserService userService = (UserService) ApplicationContextUtils.getBean("userService");
        User user = userService.findByUserName(principal);
        if(!ObjectUtils.isEmpty(user)){
            return new SimpleAuthenticationInfo(user,user.getPassword(),
            		ByteSource.Util.bytes(user.getSalt()),
                    this.getName());
        }
        return null;
    }

}
