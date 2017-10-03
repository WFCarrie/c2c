package com.c2c.dao;

import java.util.List;

import com.c2c.pojo.Comments;

public interface CommentsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comments record);

    int insertSelective(Comments record);

    Comments selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comments record);

    int updateByPrimaryKeyWithBLOBs(Comments record);

    int updateByPrimaryKey(Comments record);

	public List<Comments> getCommentsByGoodsId(Integer goods_id);
}