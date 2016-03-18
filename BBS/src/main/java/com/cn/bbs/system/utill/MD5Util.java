package com.cn.bbs.system.utill;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
/**
 * MD5加密工具
* @ClassName: MD5Util 
* @Description: TODO
* @author yanghongkang 
* @date 2015-11-21 下午11:00:56 
*
 */
public class MD5Util {
	/***
	 * MD5加密 生成32位md5�?
	 * 
	 * @param 待加密字符串
	 * @return 返回32位md5�?
	 */
	public static String md5Encode(String inStr){
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}

		byte[] byteArray = null;
		try {
			byteArray = inStr.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}
}
