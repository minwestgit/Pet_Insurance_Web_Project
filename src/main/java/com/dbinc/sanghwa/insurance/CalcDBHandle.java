package com.dbinc.sanghwa.insurance;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CalcDBHandle {

	@Autowired
	DataSource dataSource;

	Connection conn;
	PreparedStatement pstmt;

	public String selectCalc(String petname) {
		JSONArray arr = new JSONArray();
		String sql = "SELECT p_name, p_type, p_birth FROM pet where p_name = ?";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, petname);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String p_name = rs.getString("p_name");
				String p_type = rs.getString("p_type");
				Date p_birth = rs.getDate("p_birth");

				JSONObject o = new JSONObject();
				o.put("p_name", p_name);
				o.put("p_type", p_type);
				o.put("p_birth", p_birth.toString());

				arr.add(o);
			}
			rs.close(); // cursor close
			return arr.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String selectCus(String cusid) {
		JSONArray arr = new JSONArray();
		String sql = "SELECT c_name, c_pid, c_zipcode, c_road, c_detail, c_email FROM pet_customer where c_id = ?";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cusid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String c_name = rs.getString("c_name");
				String c_pid = rs.getString("c_pid");
				String c_zipcode = rs.getString("c_zipcode");
				String c_road = rs.getString("c_road");
				String c_detail = rs.getString("c_detail");

				JSONObject o = new JSONObject();
				o.put("c_name", c_name);
				o.put("c_pid", c_pid);
				o.put("c_zipcode", c_zipcode);
				o.put("c_road", c_road);
				o.put("c_detail", c_detail);

				arr.add(o);
			}
			rs.close(); // cursor close
			conn.close();
			return arr.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String selectPer() {
		JSONArray arr = new JSONArray();
		String sql = "select i_percent, ROUND((count(i_percent)* 100 / (select count(*) From insurance)),2) as per_per from insurance group by i_percent";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String i_percent = rs.getString("i_percent");
				String per_per = rs.getString("per_per");

				JSONObject o = new JSONObject();
				o.put("i_percent", i_percent);
				o.put("per_per", per_per);

				arr.add(o);
			}
			rs.close(); // cursor close
			conn.close();
			return arr.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String selectPerpay() {
		JSONArray arr = new JSONArray();
		String sql = "select i_pay, round((count(i_pay)* 100 / (select count(*) From insurance)),2) as per2 from insurance group by i_pay";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String i_pay = rs.getString("i_pay");
				String per2 = rs.getString("per2");

				JSONObject o = new JSONObject();
				o.put("i_pay", i_pay);
				o.put("per2", per2);

				arr.add(o);
			}
			rs.close(); // cursor close
			conn.close();
			return arr.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String selectIns(String cusid) {
		JSONArray arr = new JSONArray();
		String sql = "SELECT i_pay, i_percent, i_paytype, i_total, i_sp1, i_sp2, i_sp3, i_sp4, i_sp5, i_startdate FROM insurance where c_pid = ?";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cusid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int i_pay = rs.getInt("i_pay");
				int i_percent = rs.getInt("i_percent");
				String i_paytype = rs.getString("i_paytype");
				int i_total = rs.getInt("i_total");
				String i_sp1 = rs.getString("i_sp1");
				String i_sp2 = rs.getString("i_sp2");
				String i_sp3 = rs.getString("i_sp3");
				String i_sp4 = rs.getString("i_sp4");
				String i_sp5 = rs.getString("i_sp5");
				String i_startdate = rs.getString("i_startdate");

				JSONObject o = new JSONObject();
				o.put("i_pay", i_pay);
				o.put("i_percent", i_percent);
				o.put("i_paytype", i_paytype);
				o.put("i_total", i_total);
				o.put("i_sp1", i_sp1);
				o.put("i_sp2", i_sp2);
				o.put("i_sp3", i_sp3);
				o.put("i_sp4", i_sp4);
				o.put("i_sp5", i_sp5);
				o.put("i_startdate", i_startdate);

				arr.add(o);
			}
			rs.close(); // cursor close
			conn.close();
			return arr.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String selectConn(String cusid) {
		JSONArray arr = new JSONArray();
		String sql = "SELECT c_pid, c_name FROM insurance where c_pid = ?";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cusid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String c_pid = rs.getString("c_pid");
				String c_name = rs.getString("c_name");

				JSONObject o = new JSONObject();
				o.put("c_pid", c_pid);
				o.put("c_name", c_name);

				arr.add(o);
			}
			rs.close(); // cursor close
			conn.close();
			return arr.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String selectCalc() {
		JSONArray arr = new JSONArray();
		String sql = "SELECT p_name, p_type, p_birth FROM pet";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String p_name = rs.getString("p_name");
				String p_type = rs.getString("p_type");
				Date p_birth = rs.getDate("p_birth");

				JSONObject o = new JSONObject();
				o.put("p_name", p_name);
				o.put("p_type", p_type);
				o.put("p_birth", p_birth);

				arr.add(o);
			}
			rs.close(); // cursor close
			conn.close();
			return arr.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String selectIndex(String cusid) {
		JSONArray arr = new JSONArray();
		String sql = "SELECT p_name FROM pet where c_id = ?";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cusid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String p_name = rs.getString("p_name");

				JSONObject o = new JSONObject();
				o.put("p_name", p_name);

				arr.add(o);
			}
			rs.close(); // cursor close
			conn.close();
			return arr.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String selectIndex() {
		JSONArray arr = new JSONArray();
		String sql = "SELECT p_name FROM pet";
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String p_name = rs.getString("p_name");

				JSONObject o = new JSONObject();
				o.put("p_name", p_name);

				arr.add(o);
			}
			rs.close(); // cursor close
			conn.close();
			return arr.toJSONString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void insertData(int burden, int perval, String typeval, int totaldiscount, String gugang, String talgu,
			String skin, String funeral, String baesang, String c_pid, String c_name) {
		String sql = "insert into insurance values(insurance_sequence.nextVal,?,?,?,?,?,?,?,?,?,?,?,?)";
		String rst = "";

		String todatdate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, burden);
			pstmt.setInt(2, perval);
			pstmt.setString(3, typeval);
			pstmt.setInt(4, totaldiscount);
			pstmt.setString(5, gugang);
			pstmt.setString(6, talgu);
			pstmt.setString(7, skin);
			pstmt.setString(8, funeral);
			pstmt.setString(9, baesang);
			pstmt.setString(10, todatdate);
			pstmt.setString(11, c_pid);
			pstmt.setString(12, c_name);
			pstmt.execute();
			conn.close();
			rst = "insert success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			rst = "fail";
		} finally {
			System.out.println(rst);
		}

	}

}
