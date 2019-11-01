package com.sshs.system.post.mapper;

import com.sshs.core.base.mapper.BaseMapper;
import com.sshs.core.page.Page;
import com.sshs.system.post.model.Post;


/**
 * 系统管理->系统管理-岗位表类
 *
 * @author 61910
 * @date 2018/11/08
 */
public interface PostMapper extends BaseMapper<Post> {
    Page<Post> findForPageList();
}