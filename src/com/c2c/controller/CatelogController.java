package com.c2c.controller;

import com.c2c.service.CatelogService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Created by lenovo
 */
@Controller
public class CatelogController {
    @Resource
    private CatelogService catelogService;

}
