package com.c2c.service;

import java.util.List;

import com.c2c.pojo.Goods;

public interface GoodsService {
    /**
     * 发布商品
     * @param goods
     * @param duration 允许上架时长
     */
    public int addGood(Goods goods , Integer duration);

    /**
     * 通过主键获取商品
     * @param goodsId
     * @return
     */
    public Goods getGoodsByPrimaryKey(Integer goodsId);

    /**
     * 更新商品信息
     * @param goods
     */
    public void updateGoodsByPrimaryKeyWithBLOBs(int goodsId ,Goods goods);

    /**
     * 通过主键删除商品
     * @param id
     */
    public void deleteGoodsByPrimaryKey(Integer id);

    /**
     * 获取所有商品信息
     */
    public List<Goods> getAllGoods();

    List<Goods> searchGoods(String name, String describle);


    /**
     * 通过商品分类获取商品信息
     */
    public List<Goods> getGoodsByCatelog(Integer id,String name,String describle);

    /**
     * 根据分类id,并进行时间排序,获取前limit个结果
     * @param catelogId
     * @param limit
     * @return
     */
    public List<Goods> getGoodsByCatelogOrderByDate(Integer catelogId,Integer limit);

    /**
     * 根据用户的id，查询出该用户的所有闲置
     * @param user_id
     * @return
     */
    public List<Goods> getGoodsByUserId(Integer user_id);
    
    /*
     * 查询出后台管理界面的所有关于商品的信息
     */
	public List<Goods> getGoodsLists(String keyword, int currentPage,
			int pageSize);
	/**
	 * 分页查询记录总条数
	 * @param keyword
	 * @return
	 */
	public int getKeywordCount(String keyword);
	
    /*
     * 查询出后台管理界面的所有关于商品的信息
     */
	public List<Goods> GoodsListsSh(String keyword, int currentPage,int pageSize);
	/**
	 * 分页查询记录总条数
	 * @param keyword
	 * @return
	 */
	public int getKeywordCountSh(String keyword);
	
	
    /*
     * 根据Goodsid更新GOOd状态为三，即已卖出
     */
	public int updateStatusBygoodsId(int id);
	/*
	 * 审核状态更改
	 */
	public int updateGoodsStatusBygoodsId(String good_status,int id);

}