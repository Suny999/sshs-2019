package com.sshs.system.log.service.impl;

import com.sshs.core.base.service.impl.BaseServiceImpl;
import com.sshs.core.message.Message;
import com.sshs.system.log.mapper.LogMapper;
import com.sshs.system.log.model.Log;
import com.sshs.system.log.service.ILogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


/**
 * 系统管理->系统管理-系统操作日志表service实现类
 *
 * @author Suny
 * @date 2019/02/21
 */
@Service("logService")
public class LogServiceImpl extends BaseServiceImpl<LogMapper, Log> implements ILogService {
    Logger logger = LoggerFactory.getLogger(LogServiceImpl.class);

    /**
     * 保存系统管理->系统管理-系统操作日志表数据方法
     *
     * @param log
     * @return Message
     */
    @Override
    public Message<Log> save(Log log) {
        logger.debug("开始保存日志...");
        return super.save(log);
    }
}
