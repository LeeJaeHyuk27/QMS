package com.qms.approve.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qms.approve.vo.NoticeVO;
import com.qms.table.vo.approve.NoticeInfoVO;


@Repository
public interface NoticeDao {

	int insertNoticeInfo(NoticeVO vo)throws Exception;
	
	NoticeVO selectNoticeDtl(NoticeVO vo) throws Exception;

	int updateNoticeInfo(NoticeVO vo) throws Exception;

	int deleteNoticeInfo(NoticeVO vo) throws Exception;

	int selectTotalNoticeCount(NoticeVO vo) throws Exception;

	List<NoticeInfoVO> selectNoticeInfo(NoticeInfoVO vo) throws Exception;

	int deleteNoticeFile(NoticeVO vo) throws Exception;
	
}
