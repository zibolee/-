package cn.byau.system.entity;

import java.io.Serializable;
import java.util.List;


public class User  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -379580663551953302L;
	private int  id;
    private String username;
    private String password;
    private String salt;

    //定义角色集合
    private List<Role> roles;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", salt=" + salt + ", roles="
				+ roles + "]";
	}


}
