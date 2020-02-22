package com.sshs.system.user.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sshs.core.base.controller.BaseController;
import com.sshs.core.message.Message;
import com.sshs.system.user.model.User;
import com.sshs.system.user.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import java.util.List;


/**
 * 用户管理控制类
 *
 * @author Suny
 * @date 2017年7月5日 上午10:40:10
 */
@Api(tags = "系统管理-用户管理")
@RestController
@RequestMapping(value = "/v1/system/users", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_FORM_URLENCODED_VALUE})
public class UserController extends BaseController {
    @Autowired
    private IUserService userService;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    /**
     * 保存用户
     */
    @ApiOperation(value = "用户信息新增保存", nickname = "save", notes = "Adds an User to the system", tags = {"save",})
    @ApiImplicitParams({@ApiImplicitParam(paramType = "body", dataType = "User", name = "user", value = "用户对象")})
    @PostMapping
    public Message<User> save(@Validated @RequestBody @RequestParam User user) {
        logger.debug("开始保存用户信息……");
        return userService.save(user);
    }

    /**
     * 修改用户
     */
    @ApiOperation(value = "用户信息修改保存", nickname = "save", notes = "Adds an User to the system", tags = {"update",})
    @ApiImplicitParams({@ApiImplicitParam(paramType = "body", dataType = "User", name = "user", value = "用户对象")})
    @PutMapping
    public Message update(@Validated @RequestBody @RequestParam User user) {
        logger.debug("开始更新用户信息……");
        return userService.update(user);
    }

    /**
     * 删除用户
     */
    @ApiOperation(httpMethod = "DELETE", value = "根据主键删除用户", notes = "根据主键删除用户")
    @ApiImplicitParams({@ApiImplicitParam(paramType = "path", dataType = "String", name = "userId", value = "用户ID")})
    @DeleteMapping("/{userId}")
    public Message delete(@PathVariable("userId") String userId) {
        logger.debug("开始删除用户信息……");
        return userService.deleteById(userId);
    }

    /**
     * 批量删除用户
     */
    @DeleteMapping
    public Message delete(@NotEmpty(message = "${user.ids.notEmpty}") @RequestBody List<String> ids) {
        logger.debug("开始批量删除用户信息……");
        return userService.deleteByIds(ids);
    }

    /**
     * 根据主键查找用户信息
     */
    @ApiOperation(httpMethod = "GET", value = "根据主键查询用户", notes = "根据主键查询用户")
    @ApiImplicitParams({@ApiImplicitParam(paramType = "path", dataType = "String", name = "userId", value = "用户ID")})
    @GetMapping("/{userId}")
    public Message<User> getById(@PathVariable("userId") String userId) {
        logger.debug("开始查询用户信息……");
        return userService.getById(userId);
    }

    /**
     * 查询用户信息列表(分页)
     */
    @ApiOperation(httpMethod = "GET", value = "查询用户列表可分页", notes = "查询用户列表可分页")
    @ApiImplicitParams({@ApiImplicitParam(paramType = "query", dataType = "Integer", name = "limit", value = "每页条数"),
            @ApiImplicitParam(paramType = "query", dataType = "Integer", name = "offset", value = "页码"),
            @ApiImplicitParam(paramType = "query", dataType = "User", name = "user", value = "查询条件")})
    @GetMapping
    public Message<IPage<User>> queryPageList(@RequestParam(value = "limit", required = false) Integer limit, @RequestParam(value = "offset", required = false) Integer offset, @ModelAttribute User user) {
        logger.debug("开始查询用户列表信息……");
        return userService.findForPageList(limit, offset, user);
    }

    /**
     * 查询用户信息列表
     */
    @ApiOperation(httpMethod = "GET", value = "查询用户列表", notes = "查询用户列表")
    @ApiImplicitParams({@ApiImplicitParam(paramType = "query", dataType = "User", name = "user", value = "查询条件")})
    @GetMapping("/list")
    public Message<List<User>> queryList(@ModelAttribute User user) {
        logger.debug("开始查询用户列表信息……");
        return userService.findForList(user);
    }
}
