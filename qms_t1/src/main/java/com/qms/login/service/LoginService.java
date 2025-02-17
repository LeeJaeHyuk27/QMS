package com.qms.login.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.login.dao.LoginDao;
import com.qms.user.vo.UserVO;

@Service
public class LoginService {

	@Autowired
	LoginDao dao;
	
	public UserVO selectUserInfo(UserVO vo) throws Exception{
		return dao.selectUserInfo(vo);
	}
	
	public UserVO selectUserPwdInfo(UserVO vo) throws Exception{
		return dao.selectUserPwdInfo(vo);
	}
}
