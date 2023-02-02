package cn.byau.system.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.byau.system.entity.Module;
import cn.byau.system.entity.User;
import cn.byau.system.service.ModuleService;
import cn.byau.system.service.UserService;
import cn.byau.system.util.Result2;
import cn.byau.system.util.VerifyCodeUtils;

@Controller
@RequestMapping("system/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
	private ModuleService moduleService;

    /**
     * 验证码方法
     */
    @RequestMapping("getImage")
    public void getImage(HttpSession session, HttpServletResponse response) throws IOException {
        //生成验证码
        String code = VerifyCodeUtils.generateVerifyCode(4);
        //验证码放入session
        session.setAttribute("code",code);
        //验证码存入图片
        ServletOutputStream os = response.getOutputStream();
        response.setContentType("image/png");
        VerifyCodeUtils.outputImage(220,60,os,code);
    }

    /**
     * 用户注册
     */
    @RequestMapping("register")
    public String register(User user) {
        try {
            userService.register(user);
            return "redirect:/login.jsp";
        }catch (Exception e){
            e.printStackTrace();
            return "redirect:/register.jsp";
        }
    }


    /**
     * 退出登录
     */
    @RequestMapping("logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();//退出用户
        return "redirect:/login.jsp";
    }

    /**
     * 用来处理身份认证
     *
     * @param username
     * @param password
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public Result2 login(String username,String password,String code,HttpSession session) {
        //比较验证码
        String codes = (String) session.getAttribute("code");
        Result2 result2=new Result2();
        System.out.println(codes);
        try {
            if (codes.equalsIgnoreCase(code)){
                //获取主体对象
                Subject subject = SecurityUtils.getSubject();
                    subject.login(new UsernamePasswordToken(username,password));
                    User user=(User)subject.getPrincipal();
                    List<Module> list=moduleService.findMenusByUserId(user.getId());
            		System.out.println("userp"+user);
            		List<Module> menulist=userService.loadData(list);
            		System.out.println(menulist);
            			//ssion.setAttribute("user", user);
            			session.setAttribute("menuList", menulist);
            			result2.setMsg("index.jsp");
                    return result2;
            }else{
                throw new RuntimeException("验证码错误!");
            }
        } catch (UnknownAccountException e) {
            e.printStackTrace();
            System.out.println("用户名错误!");
        } catch (IncorrectCredentialsException e) {
            e.printStackTrace();
            System.out.println("密码错误!");
        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        result2.setMsg("login.jsp");
        return result2;
    }


	@RequestMapping("/updatePassword")
	@ResponseBody
	public Result2 updatePassword(String password, String oldPassword, HttpSession session) {
		Result2 result = new Result2();

		User user = (User) session.getAttribute("user");
		Md5Hash oldPassword2 = new Md5Hash(oldPassword,user.getSalt(),1024);
		if (!user.getPassword().equals(oldPassword2.toHex())) {
			result.setMsg("原密码错误");
		} else {
			Md5Hash password2 = new Md5Hash(password,user.getSalt(),1024);
			user.setPassword(password2.toHex());
			try {
				userService.update(user);
				result.setMsg("修改成功");
			} catch (Exception e) {
				// TODO: handle exception
				result.setMsg("修改失败");
			}
		}
		return result;
	}


}
