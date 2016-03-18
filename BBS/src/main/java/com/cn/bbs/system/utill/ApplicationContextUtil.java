package com.cn.bbs.system.utill;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
/**
 * 获取上下�?
* @ClassName: ApplicationContextUtil 
* @Description: TODO
* @author yanghongkang 
* @date 2015-11-21 下午11:00:40 
*
 */
public class ApplicationContextUtil implements ApplicationContextAware{

	private static ApplicationContext context;	//声明�?��静�?变量保存
	
	public void setApplicationContext(ApplicationContext contex)
			throws BeansException {
		this.context = contex;
		
	}

	public static ApplicationContext getContext() {
		return context;
	}
	
	public static Object getBean(String id) {
		return context.getBean(id);
	}
}
