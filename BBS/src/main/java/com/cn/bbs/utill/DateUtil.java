package com.cn.bbs.utill;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	/***
	 * 
	 * ��ȡ��ǰʱ��
	 * @return
	 */
	public static String getDateTime(){
		
		Date date=new Date();
		return dateTimeFormat(date);
	}
	
	
	/***
	 * ��ȡ��ǰ����
	 * @return
	 */
	public static String getDate(){
		
		Date date=new Date();
		
		return dateFormat(date);
		
	}
	
	public static String dateFormat(Date date){
		
		return format(date,"yyyy-MM-dd");
	}
	
	public static String dateTimeFormat(Date date){
		
		return format(date,"yyyy-MM-dd HH:mm:ss");
	}
	
	
	private static String format(Date date,String pattern){
		
		return new SimpleDateFormat(pattern).format(date);
		
	}
	
	public static void main(String[] args) {
		System.out.println(DateUtil.getDateTime());
	}
	

}
