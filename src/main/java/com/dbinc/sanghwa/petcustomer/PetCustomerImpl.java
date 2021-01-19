package com.dbinc.sanghwa.petcustomer;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PetCustomerImpl implements PetCustomerDAO {

	@Inject
	private SqlSession session;
	private static final String NameSpace = "petCustomerMapper.";

	@Override
	public int register(PetCustomerVO user) {
		int Id_Check_Result = userCheck(user);
		if (Id_Check_Result != 0)
			return Id_Check_Result;

		try {
			session.insert(NameSpace + "register", user);
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return -2;
		}
	}

	public int userCheck(PetCustomerVO user) {
		log.info(user.toString());
		try {
			return session.selectOne(NameSpace + "userCheck", user);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public PetCustomerVO vaildUser(PetCustomerLogin login) {
		return null;
	}

	@Override
	public int login(PetCustomerVO user, HttpSession httpsession) {
		int Id_Search_Result = -1;
		try {
			log.info(user.toString());
			Id_Search_Result = session.selectOne(NameSpace + "login", user);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

		if (Id_Search_Result != 1)
			return Id_Search_Result;

		try {
			PetCustomerVO userInfo = session.selectOne(NameSpace + "userInfo", user);
			log.info(userInfo.toString());
			httpsession.setAttribute("user", userInfo);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -2;
		}
	}

	@Override
	public int logout(HttpSession httpsession) {
		httpsession.removeAttribute("user"); // httpsession.setAttribute("user", null);
		return 0;
	}

	public int userUpdate(PetCustomerVO user, HttpSession httpsession) {
		try {
			int result = session.update(NameSpace + "userUpdate", user);
			log.info(user.toString());
			if (result != 1)
				return 0;
			httpsession.setAttribute("user", user);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int userDelete(PetCustomerVO user, HttpSession httpsession) {
		try {
			int result = session.delete(NameSpace + "userDelete", user);
			System.out.println(result);
			if (result != 1)
				return 0;
			httpsession.removeAttribute("user");
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public String genderStat() {
		JSONArray jArray = new JSONArray();
		try {
			List<GenderStatVO> list = session.selectList(NameSpace + "genderStat");
			for (int i = 0; i < list.size(); i++) {
				JSONObject data = new JSONObject();
				data.put("gender", list.get(i).getGender());
				data.put("pergender", list.get(i).getPergender());
				jArray.add(i, data);
			}
			return jArray.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
