package com.c2c.dao;

import java.util.List;

import com.c2c.pojo.Collection;

public interface CollectionMapper {
	
	List<Collection> selectScList(Integer id);
	
	int insert(Integer goods_id,Integer user_id,String img_url,String goods_name,String goods_describle);
	
	Collection selectSfsc(Integer user_id,Integer goods_id);
	
	
}
