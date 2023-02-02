package cn.byau.modules.entity;

import java.io.Serializable;

public class PieData implements Serializable {

	/**
	 * 爱旅行景点预订统计实体类
	 */
	private static final long serialVersionUID = 3747132030928486001L;
	private String name; // 景点名称
	private Integer value; // 数量
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "AlxSSR [name=" + name + ", value=" + value + "]";
	}
	
	
}

