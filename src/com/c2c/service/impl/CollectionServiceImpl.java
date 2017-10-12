package com.c2c.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.c2c.dao.CollectionMapper;
import com.c2c.pojo.Collection;
import com.c2c.service.CollectionService;
@Service("collectionService")
public class CollectionServiceImpl implements CollectionService{
	
	@Resource
	private CollectionMapper collectionMapper;
	
	/**
	 * 商品收藏新增
	 */
	public int addCollection(Integer goods_id, Integer user_id,String img_url,String goods_name,String goods_describle) {
		return collectionMapper.insert(goods_id, user_id,img_url,goods_name,goods_describle);
	}
	/**
	 * 判断商品是否收藏
	 */
    public Collection selectSfsc(Integer user_id,Integer goods_id){
        Collection collection = collectionMapper.selectSfsc(user_id, goods_id);
        return collection;
    }
    
    public List<Collection> scList(Integer user_id) {
    	List<Collection> collection = collectionMapper.selectScList(user_id);
		return collection;
	}
	@Override
	public int deleteCollectionGoods(Integer goodsId) {
		return collectionMapper.deleteCollectionGoods(goodsId);
		
	}
}
