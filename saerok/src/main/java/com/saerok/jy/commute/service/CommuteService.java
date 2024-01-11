package com.saerok.jy.commute.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.saerok.jy.commute.dto.Commute;

public interface CommuteService {

	ArrayList<Commute> selectCommuteList(Commute commute);

	Commute selectCommute(String empNo);

	void insertCommute(String empNo);

	void updateCommute(int commuteNo);

	int insertCommuteStatus(Map status);

	ArrayList<Commute> selectCommuteStatusList(int commuteNo);

}
