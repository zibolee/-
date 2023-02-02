package cn.byau.system.util;

import java.util.ArrayList;
import java.util.List;

public class StringUtil {

	/**
	 * 
	 * @param str
	 * @return
	 */
	public static List<Integer> getListFromStr(String str) {
		String[] strArr = str.split(",");
		List<Integer> ids = new ArrayList<Integer>();
		for (String s : strArr) {
			ids.add(Integer.parseInt(s));
		}
		return ids;
	}
	
}
