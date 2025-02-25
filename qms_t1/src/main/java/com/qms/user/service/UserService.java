package com.qms.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.table.vo.user.UserInfoVO;
import com.qms.user.dao.UserDao;
import com.qms.user.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserDao dao;
	
	public List<UserInfoVO> selectUserSearch(UserInfoVO vo) throws Exception{
		return dao.selectUserSearch(vo);
	}
	
	public int selectUserSearchCount(UserVO vo) throws Exception{
		return dao.selectUserSearchCount(vo);
	}
}