package com.c2c.pojo;

public class Collection {
	private int collection_id;
	private int goods_id;
	private int user_id;
	private int create_time;
	private String img_url;
	private String goods_name;
	private String goods_describle;

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_describle() {
		return goods_describle;
	}

	public void setGoods_describle(String goods_describle) {
		this.goods_describle = goods_describle;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public int getCreate_time() {
		return create_time;
	}

	public void setCreate_time(int create_time) {
		this.create_time = create_time;
	}

	public int getCollection_id() {
		return collection_id;
	}

	public void setCollection_id(int collection_id) {
		this.collection_id = collection_id;
	}

	public int getGoodsid() {
		return goods_id;
	}

	public void setGoodsid(int goodsid) {
		this.goods_id = goodsid;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Collection [collection_id=" + collection_id + ", goodsid="
				+ goods_id + ", user_id=" + user_id + "]";
	}

}
