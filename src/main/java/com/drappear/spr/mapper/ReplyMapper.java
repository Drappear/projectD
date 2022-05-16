package com.drappear.spr.mapper;

import java.util.List;

import com.drappear.spr.domain.ReplyDto;

public interface ReplyMapper {

	List<ReplyDto> selectReplyByBoardId(int boardId);

	void insertReply(ReplyDto reply);

	void updateReply(ReplyDto reply);
	
	void deleteReply(int replyId);

	void deleteReplyByBoardId(int boardId);


}
