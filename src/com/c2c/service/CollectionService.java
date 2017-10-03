package com.c2c.service;

import java.util.List;

import com.c2c.pojo.Collection;


public interface CollectionService {
	/**
	 * 商品收藏新增
	 * 
	 * @param goodsid
	 * @param user_id
	 * @return
	 */
	public int addCollection(Integer goods_id, Integer user_id,String img_url,String goods_name,String goods_describle);
	
	/**
	 * 查看是否收藏
	 * @param user_id
	 * @param goods_id
	 * @return
	 */
	public Collection selectSfsc(Integer user_id,Integer goods_id);
	
	/**
	 * 收藏列表显示
	 * @param user_id
	 * @return
	 */
	public List<Collection> scList(Integer user_id);
}
