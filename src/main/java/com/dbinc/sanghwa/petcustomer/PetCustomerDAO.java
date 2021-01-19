package com.dbinc.sanghwa.petcustomer;

import javax.servlet.http.HttpSession;

public interface PetCustomerDAO {
	int register(PetCustomerVO user);
	PetCustomerVO vaildUser(PetCustomerLogin login);
	int login(PetCustomerVO user, HttpSession httpsession);
	int logout(HttpSession httpsession);
}
