package com.forTicket.common.util;

import java.util.Map;

import com.forTicket.goods.vo.G_imageFileVO;

public class ValidUtil {
	
	public static boolean isMapEmpty(Map param, String key) {
		boolean isValue = true;
		if(param.containsKey(key)) {
			if(param.get(key) != null) {
				isValue = false;
			}else if(param.get(key).equals("")){
				isValue = true;
			}else {
				isValue = true;
			}
		}else {
			isValue = true;
		}
		
		return isValue;
	}
}
