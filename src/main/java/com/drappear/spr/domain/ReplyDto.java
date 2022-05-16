package com.drappear.spr.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReplyDto {
	private int boardId;
	private int id;
	private String content;
	private LocalDateTime inserted;
}
