package com.dbinc.sanghwa.petcustomer;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PetCustomerController {

	@Autowired
	PetCustomerImpl userImpl;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		log.info("index");
		return "index";
	}

	@RequestMapping(value = "/empty", method = RequestMethod.GET)
	public String empty(Locale locale, Model model, HttpServletResponse response) {
		return "empty";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		log.info("yg test");
		return "login";
	}

	@RequestMapping(value = "/LoginProcess", method = RequestMethod.POST)
	public String login(PetCustomerVO user, HttpSession session, RedirectAttributes rttr) {
		int check = userImpl.login(user, session);
		if (check == 1) {
			return "redirect:/index";
		} else {
			rttr.addFlashAttribute("alertmsg", "아이디 혹은 패스워드가 틀렸습니다.");
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "register";
	}

	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String registerProcess(PetCustomerVO user, Model model, RedirectAttributes rttr) {
		int check = userImpl.register(user);
		if (check == 0) {
			rttr.addFlashAttribute("alertmsg", "회원가입에 성공했습니다.");
			return "redirect:/login";
		} else {
			return "redirect:/register";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate(); // userImpl.logout(session);
		return "redirect:/index";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile() {
		return "profile";
	}

	@RequestMapping(value = "/updateProcess", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String updateProcess(PetCustomerVO user, Model model, RedirectAttributes rttr, HttpSession session) {
		int check = userImpl.userUpdate(user, session);
		if (check == 1) {
			rttr.addFlashAttribute("alertmsg", "회원정보 수정에 성공했습니다.");
		} else {
			rttr.addFlashAttribute("alertmsg", "업데이트 fail");
		}
		return "redirect:/profile";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete() {
		return "delete";
	}

	@RequestMapping(value = "/deleteProcess", method = RequestMethod.POST)
	public String deleteProcess(@ModelAttribute PetCustomerVO user, RedirectAttributes rttr, HttpSession session) {
		log.info("delete process console");
		log.info(user.toString());
		int check = userImpl.userDelete(user, session);
		if (check == 1) {
			rttr.addFlashAttribute("alertmsg", "지금까지 이용해주셔서 감사합니다.");
		} else {
			rttr.addFlashAttribute("alertmsg", "삭제 실패");
		}
		session.invalidate();
		return "redirect:/index";
	}

	@RequestMapping(value = "/genderStat", method = { RequestMethod.GET, RequestMethod.POST })
	public void genderStat(HttpServletResponse response, Model model) {
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			String jsonStr = userImpl.genderStat();
			if (jsonStr != null) {
				out.print(jsonStr);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
