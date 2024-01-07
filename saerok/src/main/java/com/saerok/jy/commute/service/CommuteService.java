package com.saerok.jy.commute.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.saerok.jy.commute.dto.Commute;

public interface CommuteService {
	ArrayList<Commute> selectWorkList(Commute commute);

	Commute selectWork(int empNo);

	void insertWork(int empNo);

	void updateWork(int commuteNo);
	
	void insertWorkStatus(String status);


}
