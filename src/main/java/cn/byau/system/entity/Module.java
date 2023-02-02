package cn.byau.system.entity;

import java.util.List;

/**
 * 模块实体类
 * @author 
 *
 */
public class Module {
	
	
	//主键id
	private int id;

	//父节点id
	private int pId;
	//节点名称
	private String name;
	//链接
	private String url;
	//跳转方式 默认：right
	private String target = "menuFrame";
	private String perms ;
	private int type;
    private List<Module> menuList;
	
	private boolean checked;
	
	public Module() {
		
	}
	
	public Module(int pId, String name, String url, String target) {
		this.pId = pId;
		this.name = name;
		this.url = url;
		this.target = target;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
    public List<Module> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Module> menuList) {
		this.menuList = menuList;
	}
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	public String getPerms() {
		return perms;
	}

	public void setPerms(String perms) {
		this.perms = perms;
	}
	@Override
	public String toString() {
		return "Module [id=" + id + ", pId=" + pId + ", name=" + name + ", url=" + url + ", target=" + target
				+ ", menuList=" + menuList + ", checked=" + checked + "]";
	}
	
	
    

	
}
