package com.yishiyong;

import com.jfinal.core.JFinal;
import com.yishiyong.controller.IndexController;


/**
 * 
 * 可以不使用该启动类，直接启动“com.jfinal.core.JFinal”即可
 *
 * <br>==========================
 * <br> 开发：coolcooldee@gmail.com
 * <br> 版本：1.0
 * <br> 创建时间：2015年8月29日
 * <br>==========================
 */
public class MyJFinalApp {

	public static void main(String[] args) {

		// HelloController为当前main方法对应的类名

		String webAppPath = IndexController.class.getResource("/").getPath().replace("/WEB-INF/classes/", "");
		String[] paths = webAppPath.split("/");
		String webAppDir = paths[paths.length-1];
		System.out.println(webAppDir);
		int port = 8080; // 在此修改端口
		String content = "/";
		if (args != null && args.length > 0) {
			try {
				port = Integer.parseInt(args[0]);
				content = args[1];
			} catch (Exception e) {
			}
		}
		try {
			JFinal.start(webAppDir, port, content, 5);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



}
