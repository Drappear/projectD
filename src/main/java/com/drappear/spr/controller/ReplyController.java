package com.drappear.spr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.drappear.spr.domain.ReplyDto;
import com.drappear.spr.service.ReplyService;

@Controller
@RequestMapping("reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	@PostMapping("add")
	public String addReplyInGetBoard(ReplyDto reply) {
		rService.insertReply(reply);
		return "redirect:/board/get/" + reply.getBoardId();
	}
	
	@PostMapping("update")
	public String updateReplyInGetBoard(ReplyDto reply) {
		rService.updateReply(reply);
		return "redirect:/board/get/" + reply.getBoardId();
	}
	
	@PostMapping("delete")
	public String deleteReplyInGetBoard(ReplyDto reply) {
		rService.deleteByReplyId(reply.getId());
		return "redirect:/board/get/" + reply.getBoardId();
	}
}
