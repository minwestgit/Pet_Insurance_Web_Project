package com.dbinc.sanghwa.petinfo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dbinc.sanghwa.petcustomer.PetCustomerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PetInfoController {
	@Autowired
	DataSource dataSource;

	@RequestMapping(value = "/petinfoinsert", method = RequestMethod.GET)
	public String petinfoinsert(Locale locale, Model model) {
		return "petinfoinsert";
	}

	@RequestMapping(value = "/petinfoinsertsave", method = RequestMethod.POST)
	public String petinfoinsertsave(@RequestParam("p_photo") MultipartFile p_photo,
			@RequestParam("p_name") String p_name, @RequestParam("p_type") String p_type,
			@RequestParam("p_birth") String p_birth, @RequestParam("p_gender") String p_gender,
			@RequestParam("p_weight") String p_weight, @RequestParam("p_status") String p_status, Model model,
			HttpSession httpsession) {
		try {
			String s = "";
			InputStream pfile;
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt;
			PetCustomerVO user = (PetCustomerVO) httpsession.getAttribute("user");
			if (p_weight.equals(""))
				p_weight = "0";
			String sql = "";
			sql = "insert into pet values(pet_sequence.nextVal,?,?,?,?,to_date(?, 'yyyy-mm-dd'),?,?,?,?)";
			s = new String(p_photo.getOriginalFilename().getBytes("8859_1"), "utf-8");
			pfile = p_photo.getInputStream();
			// db connection 객체 얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s);
			pstmt.setBlob(2, pfile);
			pstmt.setString(3, p_name);
			pstmt.setString(4, p_type);
			pstmt.setString(5, p_birth);
			pstmt.setString(6, p_gender);
			pstmt.setInt(7, Integer.parseInt(p_weight));
			pstmt.setString(8, p_status);
			// c_id 추가
			pstmt.setString(9, user.getC_id());

			pstmt.execute();
			conn.close();
			model.addAttribute("insresult", "반려견 정보를 추가했습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("insresult", "반려견 정보 추가를 실패했습니다. " + e.getMessage());
		}
		return "petinfoinsertsaveresult";
	}

	@RequestMapping(value = "/petinfoupdate", method = RequestMethod.GET)
	public String petinfoupdate(@RequestParam("p_idx") int p_idx, Locale locale, Model model) {
		ArrayList<PetInfoModel> arr = new ArrayList<PetInfoModel>();
		try {
			Connection conn = dataSource.getConnection();
			Statement stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery(
					"select p_idx, p_photo, p_name, p_type, p_birth, p_gender, p_weight, p_status from pet where p_idx="
							+ p_idx);

			while (rs.next()) {
				int p_idx1 = rs.getInt("p_idx");
				Blob p_photo = rs.getBlob("p_photo");
				String p_name = rs.getString("p_name");
				String p_type = rs.getString("p_type");
				Date p_birth = rs.getDate("p_birth");
				String p_gender = rs.getString("p_gender");
				int p_weight = rs.getInt("p_weight");
				String p_status = rs.getString("p_status");
				String sImg = "";
				if (p_photo != null) {
					// 픽셀값을 byte array로 변환
					byte[] bImg = p_photo.getBytes(1, (int) p_photo.length());
					// 인코딩
					sImg = "data:img/png;base64," + Base64.getEncoder().encodeToString(bImg);
				} else {
					sImg = null;
				}
				arr.add(new PetInfoModel(p_idx1, sImg, p_name, p_type, p_birth, p_gender, p_weight, p_status));
			}
			rs.close();
			conn.close();
			model.addAttribute("arr", arr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block e.printStackTrace();
		}
		return "petinfoupdate";
	}

	@RequestMapping(value = "/petinfoupdatesave", method = RequestMethod.POST)
	public String petinfoupdatesave(@RequestParam("p_photo") MultipartFile p_photo, @RequestParam("p_idx") int p_idx,
			@RequestParam("p_name") String p_name, @RequestParam("p_type") String p_type,
			@RequestParam("p_birth") String p_birth, @RequestParam("p_gender") String p_gender,
			@RequestParam("p_weight") String p_weight, @RequestParam("p_status") String p_status, Model model) {
		try {
			String s = new String(p_photo.getOriginalFilename().getBytes("8859_1"), "utf-8");
			InputStream pfile = p_photo.getInputStream();
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt;
			String sql = "";
			if (p_weight.equals(""))
				p_weight = "0";
			if (p_photo.getOriginalFilename() == null || p_photo.getOriginalFilename().length() == 0) {
				sql = "update pet set p_name=?, p_type=?, p_birth = to_date(?, 'yyyy-mm-dd'), p_gender=?, p_weight=?, p_status=? where p_idx="
						+ p_idx;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p_name);
				pstmt.setString(2, p_type);
				pstmt.setString(3, p_birth);
				pstmt.setString(4, p_gender);
				pstmt.setInt(5, Integer.parseInt(p_weight));
				pstmt.setString(6, p_status);
			} else {
				sql = "update pet set p_photoname=?, p_photo=?, p_name=?, p_type=?, p_birth = to_date(?, 'yyyy-mm-dd'), p_gender=?, p_weight=?, p_status=? where p_idx="
						+ p_idx;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, s);
				pstmt.setBlob(2, pfile);
				pstmt.setString(3, p_name);
				pstmt.setString(4, p_type);
				pstmt.setString(5, p_birth);
				pstmt.setString(6, p_gender);
				pstmt.setInt(7, Integer.parseInt(p_weight));
				pstmt.setString(8, p_status);
			}
			pstmt.execute();
			conn.close();
			model.addAttribute("upresult", "반려견 정보를 수정했습니다.");
		} catch (Exception e) {
			model.addAttribute("upresult", "반려견 정보 수정을 실패했습니다. " + e.getMessage());
		}
		return "petinfoupdatesaveresult";
	}

	@RequestMapping(value = "/petinfoshow", method = RequestMethod.GET)
	public String petinfoshow(Locale locale, Model model, HttpSession httpsession) {
		ArrayList<PetInfoModel> arr = new ArrayList<PetInfoModel>();
		try {
			Connection conn = dataSource.getConnection();
			Statement stmt = conn.createStatement();
			PetCustomerVO user = (PetCustomerVO) httpsession.getAttribute("user");
			// log.info(user.toString());
			ResultSet rs = stmt.executeQuery(
					"select p_idx, p_photo, p_name, p_type, p_birth, p_gender, p_weight, p_status from pet where c_id = '"
							+ user.getC_id() + "'");
			while (rs.next()) {
				int p_idx1 = rs.getInt("p_idx");
				Blob p_photo = rs.getBlob("p_photo");
				String p_name = rs.getString("p_name");
				String p_type = rs.getString("p_type");
				Date p_birth = rs.getDate("p_birth");
				String p_gender = rs.getString("p_gender");
				int p_weight = rs.getInt("p_weight");
				String p_status = rs.getString("p_status");
				String sImg = "";
				if (p_photo != null) {
					// 픽셀값을 byte array로 변환
					byte[] bImg = p_photo.getBytes(1, (int) p_photo.length());
					// 인코딩
					sImg = "data:img/png;base64," + Base64.getEncoder().encodeToString(bImg);
				} else {
					sImg = null;
				}

				arr.add(new PetInfoModel(p_idx1, sImg, p_name, p_type, p_birth, p_gender, p_weight, p_status));
			}
			rs.close();
			conn.close();
			model.addAttribute("arr", arr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block e.printStackTrace();
		}
		return "petinfoshow";
	}

	@RequestMapping(value = "/petinfodelete", method = RequestMethod.GET)
	public String petinfodelete(@RequestParam("p_idx") int p_idx, RedirectAttributes rttr, Model model,
			HttpSession session) {
		try {
			Connection conn = dataSource.getConnection();
			String sql = "delete from pet where p_idx=" + p_idx;
			log.info(sql);
			System.out.println(sql);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			model.addAttribute("delresult", "반려견 정보를 삭제했습니다.");
			pstmt.execute();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("delresult", "반려견 정보 삭제를 실패했습니다. " + e.getMessage());
		}
		return "petinfodeleteresult";
	}

}