package com.dbinc.sanghwa;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ErrorController {
	String path = "/error";

	@RequestMapping(value = "/400")
	public String error400() {
		return path + "/400";
	}

	@RequestMapping(value = "/401")
	public String error401() {
		return path + "/401";
	}

	@RequestMapping(value = "/403")
	public String error403() {
		return path + "/403";
	}

	@RequestMapping(value = "/404")
	public String error404() {
		return path + "/404";
	}
	
	@RequestMapping(value = "/500")
	public String error500() {
		return path + "/500";
	}
	
	@RequestMapping(value = "/503")
	public String error503() {
		return path + "/503";
	}
}
