package com.dbinc.sanghwa.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

public class MapDBHandle {
	@Autowired
	DataSource dataSource;

	Connection conn;
	PreparedStatement pstmt;

	public String selectHospital(String data, int check) {
		System.out.println(data);

		JSONObject maino = new JSONObject();
		JSONArray arr = new JSONArray();
		JSONArray arr1 = new JSONArray();

		double avg_lat = 0;
		double avg_long = 0;
		int cnt = 0;

		ResultSet rs = null;
		String sql = "";

		if (check == 0) {
			sql = "select * from hospital where h_address like '%" + data + "%' or h_name like '%" + data + "%'";
		} else {
			sql = "select * from hospital where (h_address like '%" + data + "%' or h_name like '%" + data
					+ "%') and h_selected = 1 ";
		}

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (rs.getString("h_address") != "") {
					int h_idx = rs.getInt("h_idx");
					String h_name = rs.getString("h_name");
					String h_address = rs.getString("h_address");
					String h_phone = rs.getString("h_phone");
					Double h_lat = rs.getDouble("h_lat");
					Double h_long = rs.getDouble("h_long");
					int h_selected = rs.getInt("h_selected");

					avg_lat += rs.getDouble("h_lat");
					avg_long += rs.getDouble("h_long");
					cnt++;

					JSONObject o = new JSONObject();
					o.put("h_idx", h_idx);
					o.put("h_name", h_name);
					o.put("h_address", h_address);
					if (h_phone == null) {
						o.put("h_phone", "");
					} else {
						o.put("h_phone", h_phone);
					}
					o.put("h_lat", h_lat);
					o.put("h_long", h_long);
					o.put("h_selected", h_selected);
					arr.add(o);
				}

			}
			maino.put("main", arr);

			avg_lat = avg_lat / cnt;
			avg_long = avg_long / cnt;

			System.out.println("후");
			System.out.println("avg_lat:" + avg_lat);
			System.out.println("avg_long:" + avg_long);

			JSONObject avg = new JSONObject();
			avg.put("avg_lat", avg_lat);
			avg.put("avg_long", avg_long);
			arr1.add(avg);
			maino.put("avg", arr1);

			rs.close();

			return maino.toJSONString();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
