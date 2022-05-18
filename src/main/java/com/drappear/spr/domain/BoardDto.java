package com.drappear.spr.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class BoardDto {
	private int id;
	private String title;
	private String body;
	private LocalDateTime inserted;
	
	private int numOfReply;
	
	public String getdifInserted() {
		LocalDateTime now = LocalDateTime.now();
		if(now.minusHours(24).isBefore(inserted)) {
			return inserted.toLocalTime().format(DateTimeFormatter.ofPattern("HH:mm"));
		} else {
			return inserted.toLocalDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		}
	}
}
