package com.qms.plan.vo;

import java.util.List;

import com.qms.table.vo.common.BaseVO;

import lombok.Data;

@Data
public class ProductVO extends BaseVO {
	
	private String compCd;
	private String planDt;
	private String itemCd;
	private String userId;
	private String productQty;
	private String regDt;
	private String regUserId;
	private String updDt;
	private String updUserId;
	private String compName;
	private String itemName;
	private String boxType;
	private String boxQty;
	private String weight;
	private String planQty;
	private String insQty;
	private String sitemCd;
	private String sitemName;
	private String userName;
	
	private List<ProductVO> modalList;
	private List<ProductVO> userList;
	private List<ProductVO> itemList;
	
	private String planYear;
	private String planMonth;

}
