package com.dbinc.sanghwa.petinfo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class PetInfoModel {
	int p_idx;
	String p_photo;
	String p_name;
	String p_type;
	Date p_birth;
	String p_gender;
	int p_weight;
	String p_status;
}