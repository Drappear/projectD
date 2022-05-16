package com.drappear.spr.domain;

import lombok.Data;

@Data
public class PageDto {
	private int fixedPageRange = 10;	// 한번에 보여질 페이지 범위
	private int fixedPagePerList = 15;	// 페이지당 게시글 수
	private int totalRecords;			// 총 게시물
	private int totalPage;				// 총 페이지
	private int currentPage;			// 현재 페이지
	private int startPage;				// 각 페이지 범위 시작 번호
	private int endPage;				// 각 페이지 범위 끝 번호
	
	public void pageInfo(int currentPage, int totalRecords) {
		this.totalPage = (totalRecords - 1) / fixedPagePerList + 1;
		
	}
}
