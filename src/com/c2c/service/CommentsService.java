package com.c2c.service;

import java.util.List;

import com.c2c.pojo.Comments;
import com.c2c.pojo.Goods;

public interface CommentsService {
	/*
	 * 添加评论
	 */
	int addComments(Comments comments);
/*
 * 根据商品id查询评论信息
 */

	List<Comments> getCommentsByGoodsId(Integer good_id);


	
	
	
}
