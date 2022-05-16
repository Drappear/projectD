package com.drappear.spr.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drappear.spr.domain.ReplyDto;
import com.drappear.spr.mapper.ReplyMapper;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyMapper rMapper;
	
	public List<ReplyDto> getReplyList(int boardId) {
		return rMapper.selectReplyByBoardId(boardId);
	}

	public void insertReply(ReplyDto reply) {
		reply.setInserted(LocalDateTime.now());
		rMapper.insertReply(reply);
	}

	public void updateReply(ReplyDto reply) {
		rMapper.updateReply(reply);
	}
	
	public void deleteByReplyId(int replyId) {
		rMapper.deleteReply(replyId);
	}


}
