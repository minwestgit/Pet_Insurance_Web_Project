package com.dbinc.sanghwa.faq;

import java.awt.List;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
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
public class FaqController {
//
	@Autowired
	FaqDBHandle faqDBHandle;

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String getList(Model model, HttpServletResponse response,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String search) throws Exception {
		try {
			System.out.println("search:" + search);
			int listCnt = 0;
			listCnt = faqDBHandle.countFaqSearch(search);
			Pagination pagi = new Pagination();
			pagi.pageInfo(page, listCnt);
			model.addAttribute("listCnt", listCnt);

			System.out.println("출력:" + pagi.toString());

			ArrayList<FaqVO> list = (ArrayList<FaqVO>) faqDBHandle.makeFaqList(search, pagi);

			// System.out.println(page);
			model.addAttribute("pagination", pagi);
			model.addAttribute("list", list);

			model.addAttribute("pageCnt", pagi.getPageCnt());
			model.addAttribute("search", search);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "faq";
	}
}
