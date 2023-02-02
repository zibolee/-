package cn.byau.system.util;



import java.util.List;

/**
 * 列表查询封装VO
 *
 * @author w
 * @date 2021-03-05
 */
public class PageVo<T> {

  //  @ApiModelProperty(value = "总记录数")
    private Integer count;

    //@ApiModelProperty(value = "列表数据")
    private List<T> list;

    public PageVo() {
    }

    public PageVo(Integer count, List<T> list) {
        this.setCount(count);
        this.setList(list);
    }

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
}
