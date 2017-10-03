package com.c2c.service.impl;

import com.c2c.dao.ImageMapper;
import com.c2c.pojo.Image;
import com.c2c.service.ImageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lenovo on 2017/5/12.
 */
@Service("imageService")
public class ImageServiceImpl implements ImageService {
    @Resource
    private ImageMapper imageMapper;
    public int insert(Image record) {
        return imageMapper.insert(record);
    }
    public List<Image> getImagesByGoodsPrimaryKey(Integer goodsId) {
        List<Image> image = imageMapper.selectByGoodsPrimaryKey(goodsId);
        return image;
    }
    public int deleteImagesByGoodsPrimaryKey(Integer goodsId) {
        return imageMapper.deleteImagesByGoodsPrimaryKey(goodsId);
    }
}
