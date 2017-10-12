package com.c2c.controller;

import com.c2c.pojo.User;
import com.c2c.util.UserGrid;
import com.c2c.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;

/**
 * main
 * <p>Title:MainController</p>
 * <p>Description: </p>
 * <p>Company:com.c2c</p>
 * @author Muling
 * @date 2017年10月11日 下午4:06:08
 * @version 1.0
 */
@Controller
public class MainController {

    @Resource
    private UserService userService;
    @RequestMapping(value = "/api/v1/users")
    @ResponseBody
    public UserGrid getUserList(@RequestParam(value = "page",required = false) Integer page,
                                @RequestParam(value = "pageSize",required = false) Integer pageSize,
                                @RequestParam(value = "username",required = false) String username) {
        System.out.println("username:"+username);
//        int total = userService.getUserNum(username);
        int total = 2;
        String pageStr = page + "";
        String pageSizeStr = pageSize + "";
        if("".equals(pageStr))
            page = 1;
        if("".equals(pageSizeStr))
            pageSize = 10;
//        List<User> data = userService.getPageUser(1,10,username);
//        List<User> data = userService.getPageUser(1,10);
        List<User> data = new ArrayList<User>();
        System.out.println("data:"+data.size());
        UserGrid userGrid = new UserGrid();
//        userGrid.setData(data);
        userGrid.setTotal(total);
        return userGrid;
    }
}
