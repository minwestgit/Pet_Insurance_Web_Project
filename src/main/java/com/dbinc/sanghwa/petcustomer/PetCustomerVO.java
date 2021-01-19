package com.dbinc.sanghwa.petcustomer;

import java.sql.Date;

import lombok.Data;

@Data
public class PetCustomerVO {
	String c_id;
	String c_pw;
	String c_name;
	String c_pid;
	String c_gender;
	String c_zipcode;
	String c_road;
	String c_detail;
	String c_phone;
	String c_email;
	Date c_joindate;
}
