package com.cn.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloWordController {
	@RequestMapping(value="/hello")
	public ModelAndView sayHello(ModelMap modelMap){

		String message="hello world, spring 3.1!";
		System.out.println(message);
		
		return new ModelAndView("hello","message",message);
		
		
	}

}
