package com.drappear.spr.domain;

import lombok.Data;

@Data
public class PageDto {
	private int fixedPageRange = 10;		// 한번에 보여질 페이지 범위
	private int fixedPagePerList = 10;		// 페이지당 게시글 수
	private int totalRecords;				// 총 게시물
	private int currentEndPage;				// 현재 페이지 범위 중 마지막 번호
	private int currentPage;				// 현재 페이지
	private int startPage;					// 각 페이지 범위 시작 번호
	private int endPage;					// 각 페이지 범위 끝 번호
	private boolean prev;
	private boolean next;

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
		calPage();
	}
	
	private void calPage() {
		endPage = (int)(Math.ceil(currentPage/(double)fixedPageRange)) * fixedPageRange;
		startPage = (endPage - fixedPageRange) + 1;		
		currentEndPage = (int)(Math.ceil((totalRecords) / (double)fixedPagePerList));
		if(currentEndPage < endPage) {
			endPage = currentEndPage;
		}
		prev = currentPage > 1;
		next = endPage < currentEndPage;		
	}	
}
