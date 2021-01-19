package com.dbinc.sanghwa.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

public class FaqDBHandle {

	@Autowired
	DataSource dataSource;

	Connection conn;
	PreparedStatement pstmt;

	@Autowired
	Pagination pagi;

	public int countFaqSearch(String data) {
		String sql = "";

		if (data.equals("")) {
			sql = "select count(*) as faqCnt from faq";
		} else {
			sql = "select count(*) from faq where question like '%" + data + "%'";
		}

		int rowcnt = 0;
		ResultSet rs = null;

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rowcnt = rs.getInt(1);
			}

			rs.close();
			conn.close();
//                        pagi.setListCnt(rowcnt);

			return rowcnt;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	public String makeFaqJson(String data, Pagination pagi) {

		JSONArray arr = new JSONArray();
		ResultSet rs = null;
		String sql = "";

		if (data.equals("")) {

			sql = "select f_idx, question, answer from " + "(select rownum as rnum, A.f_idx, A.question, A.answer from"
					+ "(select f_idx, question, answer from faq order by f_idx desc) A " + "where rownum <=?) X "
					+ "where X.rnum >=?";
		} else {

			sql = "select f_idx, question, answer from " + "(select rownum as rnum, A.f_idx, A.question, A.answer from"
					+ "(select f_idx, question, answer from faq where question like '%" + data
					+ "%' order by f_idx desc) A " + "where rownum <=?) X where X.rnum >=? ";
		}

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pagi.getPage() * pagi.getListSize());
			pstmt.setInt(2, (pagi.getPage() - 1) * pagi.getListSize() + 1);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int f_idx = rs.getInt("f_idx");
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				JSONObject o = new JSONObject();
				o.put("f_idx", f_idx);
				o.put("question", question);
				o.put("answer", answer);
				arr.add(o);
			}
			rs.close();
			conn.close();
			return arr.toJSONString();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public List<FaqVO> makeFaqList(String data, Pagination pagi) {

		List<FaqVO> arr = new ArrayList<FaqVO>();
		ResultSet rs = null;
		String sql = "";

		if (data.equals("")) {

			sql = "select f_idx, question, answer from " + "(select rownum as rnum, A.f_idx, A.question, A.answer from"
					+ "(select f_idx, question, answer from faq order by f_idx desc) A " + "where rownum <=?) X "
					+ "where X.rnum >=?";
		} else {

			sql = "select f_idx, question, answer from " + "(select rownum as rnum, A.f_idx, A.question, A.answer from"
					+ "(select f_idx, question, answer from faq where question like '%" + data
					+ "%' order by f_idx desc) A " + "where rownum <=?) X where X.rnum >=? ";
		}

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pagi.getPage() * pagi.getListSize());
			pstmt.setInt(2, (pagi.getPage() - 1) * pagi.getListSize() + 1);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int f_idx = rs.getInt("f_idx");
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				FaqVO o = new FaqVO();
				o.setF_idx(f_idx);
				o.setQeustion(question);
				o.setAnswer(answer);

				arr.add(o);
			}
			rs.close();
			conn.close();
			return arr;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
