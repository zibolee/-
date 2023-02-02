package cn.byau.system.util;

/**
 * 接口响应
 *
 * @author w
 * @date 2021-03-05
 */
public class Message<T> {

    
    private String code;

   
    private String message;

   
    private T data;

    public Message() {
    }

    public Message(String code, String message, T data) {
        this.setCode(code);
        this.setMessage(message);
        this.setData(data);
    }

    /**
     * 成功
     *
     * @return
     */
    public static Message success() {
        return success(null);
    }

    /**
     * 成功
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> Message success(T data) {
        return new Message(HttpResponse.SUCCESS.getIndex(), HttpResponse.SUCCESS.getValue(), data);
    }

    /**
     * 失败
     *
     * @param httpResponse
     * @return
     */
    public static Message error(HttpResponse httpResponse) {
        return new Message(httpResponse.getIndex(), httpResponse.getValue(), null);
    }

    /**
     * 提示信息
     *
     * @param message
     * @return
     */
    public static Message tips(String message) {
        return new Message(HttpResponse.TIPS.getIndex(), message, null);
    }

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
}
