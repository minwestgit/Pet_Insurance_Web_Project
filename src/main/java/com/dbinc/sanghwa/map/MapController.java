package com.dbinc.sanghwa.map;

import java.awt.List;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.util.Locale;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {

	@Autowired
	MapVO mapVO;

	@Autowired
	MapDBHandle mapDBHandle;

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String mapFn(Locale locale, Model model) {

		return "map";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void makeMapFn(HttpServletResponse response, Model model, @RequestParam("search") String search,
			@RequestParam("check") int check) {
		response.setContentType("text/html; charset=UTF-8");

		System.out.println("search:" + search);
		System.out.println("check:" + check);
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = "";
			jsonStr = mapDBHandle.selectHospital(search, check);
//                        if (check == 1) {
//                                jsonStr = mapDBHandle.selectHospital(search, check);
//                        } else if (check == 0) {
//                                jsonStr = mapDBHandle.selectHospital(search);
//                        }

			System.out.println("jsonStr:" + jsonStr);
			if (jsonStr != null)
				System.out.println("not null");
			out.print(jsonStr);
			out.flush();
//                        model.addAttribute("dataa", jsonStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
