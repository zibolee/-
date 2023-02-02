package cn.byau.system.util;

/**
 * 系统状态码
 * 0000：成功
 * 1xxx：系统异常状态码
 * 2xxx：提示类状态码
 * 9999：token过期
 *
 * @author w
 * @date 2021-03-05
 */

public enum HttpResponse {

    /**
     * 成功
     */
    SUCCESS("0000", "成功"),
    /**
     * 系统错误
     */
    SYSTEM_ERROR("1001", "系统错误"),
    /**
     *提示信息
     */
    TIPS("2001", ""),
    /**
     * token过期
     */
    TOKEN_INVALID("9999", "token过期");

    private String index;
    private String value;

    HttpResponse(String index, String value) {
        this.setIndex(index);
        this.setValue(value);
    }

    public static String getValue(String index) {
        for (HttpResponse dataSourceEnum : HttpResponse.values()) {
            if (dataSourceEnum.getIndex().equals(index)) {
                return dataSourceEnum.getValue();
            }
        }
        return null;
    }

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
