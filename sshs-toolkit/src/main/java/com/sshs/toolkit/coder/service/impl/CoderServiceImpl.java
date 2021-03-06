package com.sshs.toolkit.coder.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sshs.core.base.service.impl.BaseServiceImpl;
import com.sshs.core.exception.BusinessException;
import com.sshs.core.message.Message;
import com.sshs.core.page.Page;
import com.sshs.core.util.ReflectHelper;
import com.sshs.core.util.Serializabler;
import com.sshs.core.util.UuidUtil;
import com.sshs.core.wrapper.QueryWrapper;
import com.sshs.toolkit.coder.helper.CoderGenerator;
import com.sshs.toolkit.coder.mapper.CoderMapper;
import com.sshs.toolkit.coder.model.Coder;
import com.sshs.toolkit.coder.model.Column;
import com.sshs.toolkit.coder.service.ICoderService;
import com.sshs.toolkit.configuration.ToolkitConfigProp;
import com.sshs.toolkit.error.ToolkitErrorCode;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * 类名称：CreateCodeService 代码生成器
 *
 * @author Suny
 * @version 1.0
 * @date 2015年11月24日
 */
@Service("coderService")
public class CoderServiceImpl extends BaseServiceImpl<CoderMapper, Coder> implements ICoderService {

    Logger logger = LoggerFactory.getLogger(CoderServiceImpl.class);
    @Resource
    private CoderMapper coderMapper;
    @Resource
    CoderGenerator coderGenerator;
    @Resource
    ToolkitConfigProp toolketConfigProp;

    /**
     * 新增
     *
     * @param coder
     */
    @Override
    public Message save(Coder coder) {
        deleteByTableName(coder.getTableName());
        try {
            logger.debug("开始保存代码信息……");
            coder.setCoderId(UuidUtil.get32UUID());
            logger.debug("===========>" + coder.getTableName());
            for (Column col : coder.getFields()) {
                if (StringUtils.isEmpty(coder.getTableName())) {
                    coder.setTableName(col.getTableName());
                    coder.setTableComment(col.getTableComment());
                }
                col.setPropertyName(ReflectHelper.getPropertyName(col.getColumnName()));
                col.setPropertyType(coderGenerator.getPropertyType(col.getColumnType()));
            }

            coder.setColumns(Serializabler.object2Bytes(coder.getFields()));

            coderGenerator.generate(coder);
            super.save(coder);
            return Message.success(coder);
        } catch (Exception e) {
            logger.error("保存代码信息异常！", e);
            throw new BusinessException(ToolkitErrorCode.GENERATE_EXCEPTION, e);
        }
    }

    /**
     * 新增
     *
     * @param tableName
     */
    @Override
    public Message run(String tableName) {
        //deleteByTableName(tableName);
        // coder.setCoderId(UuidUtil.get32UUID());
        try {
            logger.debug("开始保存代码信息……");
            Coder coder = new Coder();
            coder.setCoderId(UuidUtil.get32UUID());
            coder.setTableName(tableName);
            List<Column> cols = findColumnForList(tableName);
            if (cols == null || cols.isEmpty()) {
                logger.error("数据表不存在{}", tableName);
                return Message.failure(ToolkitErrorCode.COLUMN_NOT_FOUND);
            }
            coder.setFields(cols);
            for (Column col : coder.getFields()) {
                if (StringUtils.isEmpty(coder.getTableName())) {
                    coder.setTableName(col.getTableName());
                    coder.setTableComment(col.getTableComment());
                }
                col.setPropertyName(ReflectHelper.getPropertyName(col.getColumnName()));
                col.setPropertyType(coderGenerator.getPropertyType(col.getColumnType()));
            }

            coder.setColumns(Serializabler.object2Bytes(coder.getFields()));

            coderGenerator.generate(coder);
            return Message.success(coder);
        } catch (Exception e) {
            logger.error("保存代码信息异常！", e);
            throw new BusinessException(ToolkitErrorCode.GENERATE_EXCEPTION, e);
        }
    }

    /**
     * 根据表名删除生成记录
     *
     * @param tableName
     */
    private void deleteByTableName(String tableName) {
        QueryWrapper<Coder> example = new QueryWrapper<>();
        example.eq("tableName", tableName);
        coderMapper.delete(example);
    }

    /**
     * 列表(主表)
     *
     * @param tableName
     */
    @Override
    public List<Column> findColumnForList(String tableName) {
        return coderMapper.findColumnAll(toolketConfigProp.getDbUser(), tableName);
    }

    public Message<IPage<Coder>> findDbTableForPageList(int limit, int offset, Map<String, Object> params) {
        return Message.success(coderMapper.findDbTableForPageList(new Page(offset, limit), toolketConfigProp.getDbUser(), params));
    }

}
