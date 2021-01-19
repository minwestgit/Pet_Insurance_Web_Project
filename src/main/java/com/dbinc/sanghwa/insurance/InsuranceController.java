package com.dbinc.sanghwa.insurance;

import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InsuranceController {
	@Autowired
	CalcDBHandle db;

	@Autowired
	DataSource dataSource;

	@RequestMapping(value = "/inscalmoney", method = { RequestMethod.GET, RequestMethod.POST })
	public String inscalmoney(HttpServletRequest request, Model model, HttpSession session) {
		return "inscalmoney";
	}

	@RequestMapping(value = "/inscusinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public String inscusinfo(HttpServletRequest request, Model model) {
		return "inscusinfo";
	}

	@RequestMapping(value = "/inspetinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public String inspetinfo(HttpServletRequest request, Model model) {
		return "inspetinfo";
	}

	@RequestMapping(value = "/insobligation", method = { RequestMethod.GET, RequestMethod.POST })
	public String insobligation(Locale locale, Model model) {
		return "insobligation";
	}

	@RequestMapping(value = "/insfinalchk", method = { RequestMethod.GET, RequestMethod.POST })
	public String insfinalchk(Locale locale, Model model) {
		return "insfinalchk";
	}

	@RequestMapping(value = "/insconnect", method = { RequestMethod.GET, RequestMethod.POST })
	public String insconnect(Locale locale, Model model) {
		return "insconnect";
	}

	@RequestMapping(value = "/insconshow", method = { RequestMethod.GET, RequestMethod.POST })
	public String insconshow(Locale locale, Model model) {
		return "insconshow";
	}

	@RequestMapping(value = "/selectpetinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public void selectpetinfo(HttpServletResponse response, Model model, @RequestParam String p_name) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			System.out.println(p_name);

			String jsonStr = db.selectCalc(p_name);

			model.addAttribute("");

			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/selectcusinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public void selectcusinfo(HttpServletResponse response, Model model, @RequestParam String c_id) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = db.selectCus(c_id);

			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/selectinsinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public void selectinsinfo(HttpServletResponse response, Model model, @RequestParam String c_pid) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = db.selectIns(c_pid);

			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/selectcompare", method = { RequestMethod.GET, RequestMethod.POST })
	public void selectcompare(HttpServletResponse response, Model model, @RequestParam String c_pid) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = db.selectConn(c_pid);

			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/selectper", method = { RequestMethod.GET, RequestMethod.POST })
	public void selectper(HttpServletResponse response, Model model) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = db.selectPer();
			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/selectper2", method = { RequestMethod.GET, RequestMethod.POST })
	public void selectper2(HttpServletResponse response, Model model) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = db.selectPerpay();
			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/selectpetinput", method = { RequestMethod.GET, RequestMethod.POST })
	public void selectpetinput(HttpServletResponse response, Model model, @RequestParam String c_id) {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("customer id" + c_id);
		try {
			PrintWriter out = response.getWriter();

			String jsonStr = db.selectIndex(c_id);

			model.addAttribute("");

			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/inscomplete", method = { RequestMethod.GET, RequestMethod.POST })
	public String inscomplete(HttpServletResponse response, Model model, @RequestParam int burden,
			@RequestParam int perval, @RequestParam String typeval, @RequestParam int totaldiscount,
			@RequestParam String gugang, @RequestParam String talgu, @RequestParam String skin,
			@RequestParam String funeral, @RequestParam String baesang, @RequestParam String c_pid,
			@RequestParam String c_name) {
		response.setContentType("text/html; charset=UTF-8");
		db.insertData(burden, perval, typeval, totaldiscount, gugang, talgu, skin, funeral, baesang, c_pid, c_name);
		return "inscomplete";
	}

}