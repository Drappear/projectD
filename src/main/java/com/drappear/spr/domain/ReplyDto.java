package com.drappear.spr.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReplyDto {
	private int boardId;
	private int id;
	private String content;
	private LocalDateTime inserted;
	
	public String getdifInserted() {
		LocalDateTime now = LocalDateTime.now();
		if(now.minusHours(24).isBefore(inserted)) {
			return inserted.toLocalTime().toString();
		} else {
			return inserted.toLocalDate().toString();
		}
	}
}
