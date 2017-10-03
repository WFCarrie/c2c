package com.c2c.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.c2c.dao.CommentsMapper;
import com.c2c.dao.UserMapper;
import com.c2c.pojo.Comments;
import com.c2c.pojo.Goods;
import com.c2c.service.CommentsService;
import com.c2c.service.GoodsService;
import com.c2c.util.DateUtil;

/*
 * 评论的发布
 */
@Service("commentsService")
public   class CommentsServiceImpl implements CommentsService{
	@Resource
	private CommentsMapper commentsMapper;

	@Override
	public int addComments(Comments comments) {
		// TODO Auto-generated method stub
		 String startTime = DateUtil.getNowDay();
		 comments.setCreateAt(startTime);
		return commentsMapper.insert(comments);
	}
	
    public List<Comments> getCommentsByGoodsId(Integer goods_id) {
    	List<Comments> commentsList = commentsMapper.getCommentsByGoodsId(goods_id);
        return commentsList;
    }

	
}
