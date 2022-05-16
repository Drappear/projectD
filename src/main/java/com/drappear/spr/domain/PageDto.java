package com.drappear.spr.domain;

import lombok.Data;

@Data
public class PageDto {
	private int fixedPageRange = 10;			// 한번에 보여질 페이지 범위
	private int fixedPagePerList = 15;		// 페이지당 게시글 수
	private int totalRecords;			// 총 게시물
	private int totalPage;				// 총 페이지
	private int currentPage;			// 현재 페이지
	private int startPage;				// 각 페이지 범위 시작 번호
	private int endPage;				// 각 페이지 범위 끝 번호
	private int idxNum;
	private boolean prev;
	private boolean next;
	
	public int getStartPage() {
		endPage = (int)(Math.ceil(getCurrentPage()/10.0)) * 10;
		startPage = endPage - 9;
		
		return startPage;
	}
	
	public int getEndPage() {
		endPage = (int)(Math.ceil(getCurrentPage()/10.0)) * 10;
		int totalPage = (int)(Math.ceil((getTotalRecords() * 1.0) / getFixedPagePerList()));
		
		if(totalPage < endPage) {
			endPage = totalPage;
		}
		
		return endPage;
	}
	
	public int getIdxNum() {
		idxNum = (getCurrentPage() - 1) * getFixedPagePerList();
		
		return idxNum;
	}
	
	public boolean getPrev() {
		prev = getStartPage() > 1;
		return prev;
	}
	
	public boolean getNext() {
		int totalPage = (int)(Math.ceil((getTotalRecords() * 1.0) / getFixedPagePerList()));
		
		next = getEndPage() < totalPage;
		
		return next;
	}
	
	public int getTotalPage() {
		totalPage = (int)(Math.ceil((getTotalRecords() * 1.0) / getFixedPagePerList()));
		
		return totalPage;
	}
}
