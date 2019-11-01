package com.sshs.core.base.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sshs.core.message.Message;
import com.sshs.core.page.Page;

import java.util.List;
import java.util.Map;

/**
 * 基础服务接口
 *
 * @param <T>
 * @author Suny
 */
public interface IBaseService<T> {
    /**
     * 新增
     *
     * @param model 待保存的对象
     * @return 保存后的对象
     */
    Message<T> save1(T model);

    /**
     * 批量新增(不推荐使用，且记录数不要超过2000)
     *
     * @param models 待保存的对象列表
     * @return 保存成功的记录数
     */
    Message<Boolean> saveList(List<T> models);

    /**
     * 修改
     *
     * @param model 要更新的对象
     * @return 更新后的对象
     */
    Message<T> update1(T model);

    /**
     * 批量修改
     *
     * @param models 要更新的记录列表
     * @return 更新成功的记录数
     */
    Message<Integer> updateList(List<T> models);

    /**
     * 删除
     *
     * @param model 要删除的对象
     * @return 返回删除的对象
     */
    Message<T> delete1(T model);

    /**
     * 根据主键删除
     *
     * @param id 待删除对象的主键
     * @return 删除成功的数量
     */
    Message<Boolean> deleteById(String id);

    /**
     * 根据主键批量删除
     *
     * @param ids 要删除的记录主键列表
     * @return 返回删除记录数
     */
    Message<Boolean> deleteByIds(List<String> ids);


    /**
     * 根据主键查询单笔记录
     *
     * @param id ID
     * @return 查询到的对象
     */
    Message<T> getById(String id);

    /**
     * 根据主键查询单笔记录
     *
     * @param id ID
     * @return 查询到的对象
     */
    T getEntityById(String id);

    /**
     * 分页查询方法
     *
     * @param page      分页信息
     * @param parameter 查询条件
     * @return 分页查询结果
     */
    Message<IPage<T>> findForPageList(Page<T> page, Object parameter);

    /**
     * 公共列表查询方法
     *
     * @param parameter 查询条件
     * @return 查询结果
     */
    Message<List<T>> findForList(Object parameter);

    /**
     * 分页查询方法
     *
     * @param limit     分页信息
     * @param offset    页码
     * @param parameter 查询条件
     * @return 分页查询结果
     */
    Message<IPage<T>> queryPageList(String limit, String offset, Map<String, Object> parameter);
}
