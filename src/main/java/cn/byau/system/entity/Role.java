package cn.byau.system.entity;

import java.io.Serializable;

public class Role implements Serializable{

	private static final long serialVersionUID = 8496938240376064251L;
	/**
	 * 角色主键id
	 */
	private Integer roleId;
	
	/**
	 * 角色名称
	 */
	private String roleName;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
}
