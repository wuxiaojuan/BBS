package com.cn.bbs.system.utill;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * 读取配置文件
 * 
 * @ClassName: PropertiesUtil
 * @Description: TODO
 * @author yanghongkang
 * @date 2015-11-21 下午11:01:06
 * 
 */
public class PropertiesUtil {
	private static Logger log = Logger.getLogger(PropertiesUtil.class);

	/**
	 * 
	 * @param propertiesname
	 * @param keyname
	 * @return
	 */
	public static String getproperties(String propertiesname, String keyname) {
		InputStream inputStream = PropertiesUtil.class.getClassLoader()
				.getResourceAsStream(propertiesname);
		Properties p = new Properties();
		try {
			p.load(inputStream);
		} catch (IOException e) {
			log.info("读取配置文件异常" + e.getMessage());
			e.printStackTrace();
		}
		return p.getProperty(keyname);
	}

	public static void main(String[] args) {
		System.out.println(new PropertiesUtil().getproperties(
				"requestType.properties", "request.types"));

	}
}
