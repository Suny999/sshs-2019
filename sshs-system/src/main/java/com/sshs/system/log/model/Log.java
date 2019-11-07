package com.sshs.system.log.model;

import com.sshs.core.util.UUIdGenId;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.ibatis.type.Alias;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

/**
 * 系统管理->系统管理-系统操作日志表bean Log类
 *
 * @author allen
 * @date 2019/02/21
 */
@Alias("Log")
@Table(name = "SYS_LOG")
public class Log implements Serializable {

    private static final long serialVersionUID = 1L;


    /**
     * ID
     */
    @Id
    @KeySql(genId = UUIdGenId.class)
    @Column(name = "LOG_ID",length = 32)
    private String logId;

    /**
     * 法人行社
     */
    @Column(name = "LEGAL_ORG")
    private String legalOrg;

    /**
     * 创建人
     */
    @Column(name = "CRT_USER_CODE")
    private String crtUserCode;

    /**
     * 创建机构
     */
    @Column(name = "CRT_ORG_CODE")
    private String crtOrgCode;

    /**
     * 创建日期
     */
    @Column(name = "CRT_DATE")
    private Date crtDate;

    /**
     * 修改人
     */
    @Column(name = "UPD_USER_CODE")
    private String updUserCode;

    /**
     * 修改机构
     */
    @Column(name = "UPD_ORG_CODE")
    private String updOrgCode;

    /**
     * 修改日期
     */
    @Column(name = "UPD_DATE")
    private Date updDate;

    /**
     * 操作用户编号
     */
    @Column(name = "USER_CODE")
    private String userCode;

    /**
     * 操作用户名称
     */
    @Column(name = "USER_NAME")
    private String userName;

    /**
     * 模块
     */
    @Column(name = "MODULE")
    private String module;

    /**
     * 操作内容
     */
    @Column(name = "ACTION")
    private String action;
    /**
     * 操作时间
     */
    @Column(name = "OPT_DATE")
    private Date optDate;
    /**
     * 客户端IP地址
     */
    @Column(name = "CLIENT_IP")
    private String clientIp;

    /**
     * 执行方法名
     */
    @Column(name = "METHOD")
    private String method;

    /**
     * 输入参数
     */
    @Column(name = "PARAMS")
    private String params;

    /**
     * 描述
     */
    @Column(name = "OPT_DESC")
    private String optDesc;
    /**
     * 操作结束时间
     */
    @Transient
    private Date optDateEnd;

    public Date getOptDateEnd() {
        return optDateEnd;
    }

    public void setOptDateEnd(Date optDateEnd) {
        this.optDateEnd = optDateEnd;
    }

    public String getLogId() {
        return this.logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getLegalOrg() {
        return this.legalOrg;
    }

    public void setLegalOrg(String legalOrg) {
        this.legalOrg = legalOrg;
    }

    public String getCrtUserCode() {
        return this.crtUserCode;
    }

    public void setCrtUserCode(String crtUserCode) {
        this.crtUserCode = crtUserCode;
    }

    public String getCrtOrgCode() {
        return this.crtOrgCode;
    }

    public void setCrtOrgCode(String crtOrgCode) {
        this.crtOrgCode = crtOrgCode;
    }

    public Date getCrtDate() {
        return this.crtDate;
    }

    public void setCrtDate(Date crtDate) {
        this.crtDate = crtDate;
    }

    public String getUpdUserCode() {
        return this.updUserCode;
    }

    public void setUpdUserCode(String updUserCode) {
        this.updUserCode = updUserCode;
    }

    public String getUpdOrgCode() {
        return this.updOrgCode;
    }

    public void setUpdOrgCode(String updOrgCode) {
        this.updOrgCode = updOrgCode;
    }

    public Date getUpdDate() {
        return this.updDate;
    }

    public void setUpdDate(Date updDate) {
        this.updDate = updDate;
    }

    public String getUserCode() {
        return this.userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getModule() {
        return this.module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public String getAction() {
        return this.action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getClientIp() {
        return this.clientIp;
    }

    public void setClientIp(String clientIp) {
        this.clientIp = clientIp;
    }

    public String getMethod() {
        return this.method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getParams() {
        return this.params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public String getOptDesc() {
        return this.optDesc;
    }

    public void setOptDesc(String optDesc) {
        this.optDesc = optDesc;
    }

    public Date getOptDate() {
        return optDate;
    }

    public void setOptDate(Date optDate) {
        this.optDate = optDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this)
                .append("logId", logId)
                .append("legalOrg", legalOrg)
                .append("crtUserCode", crtUserCode)
                .append("crtOrgCode", crtOrgCode)
                .append("crtDate", crtDate)
                .append("updUserCode", updUserCode)
                .append("updOrgCode", updOrgCode)
                .append("updDate", updDate)
                .append("userCode", userCode)
                .append("userName", userName)
                .append("module", module)
                .append("action", action)
                .append("optDate", optDate)
                .append("clientIp", clientIp)
                .append("method", method)
                .append("params", params)
                .append("optDesc", optDesc)
                .append("optDateEnd", optDateEnd)
                .toString();
    }
}