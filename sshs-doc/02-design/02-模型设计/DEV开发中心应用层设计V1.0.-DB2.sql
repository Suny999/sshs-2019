-- 建表脚本-DB2
-- 索引目录表
CREATE TABLE DEV_INDEX_PATH(
  PATH_ID  varchar(32) NOT NULL,
  PATH_NAME  varchar(200),
  PARENT_ID  varchar(32),
  PATH_TEXT  varchar(500),
  PATH_MODULE  varchar(500),
  PATH_LEVEL  DECIMAL(5),
  PATH_ICONS  varchar(300),
  PATH_ORDER  DECIMAL(5),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_INDEX_PATH PRIMARY KEY (PATH_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_INDEX_PATH IS '开发中心-索引目录表';
 COMMENT ON DEV_INDEX_PATH(
PATH_ID IS  '路径编号',
PATH_NAME IS  '路径名称',
PARENT_ID IS  '上级路径',
PATH_TEXT IS  '全路径',
PATH_MODULE IS  '功能模块',
PATH_LEVEL IS  '路径层级',
PATH_ICONS IS  '图标',
PATH_ORDER IS  '路径排序',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 数据源表
CREATE TABLE DEV_DATA_SOURCE(
  SOURCE_ID  varchar(32) NOT NULL,
  SOURCE_NAME  varchar(200),
  SOURCE_DESC  varchar(500),
  SOURCE_TYPE  varchar(2),
  DRIVE_TYPE  varchar(50),
  DRIVE_CLASS  varchar(100),
  CONN_URL  varchar(500),
  DB_NAME  varchar(255),
  USER_NAME  varchar(50),
  PASSWORD  varchar(100),
  SRC_CHARACTER  varchar(100),
  GOAL_CHARACTER  varchar(100),
  VERIFY_TYPE  varchar(1),
  MAX_CONN  DECIMAL(11),
  CHECK_TYPE  varchar(1),
  SENTERNCE  varchar(300),
  TRAN_LEVEL  varchar(1),
  REF_ID  varchar(300),
  STATUS  varchar(1),
  INDEX_PATH  varchar(32),
  ICONS  varchar(300),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_DATA_SOURCE PRIMARY KEY (SOURCE_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_DATA_SOURCE IS '开发中心-数据源表';
 COMMENT ON DEV_DATA_SOURCE(
SOURCE_ID IS  '数据源编号',
SOURCE_NAME IS  '数据源名称',
SOURCE_DESC IS  '数据源描述',
SOURCE_TYPE IS  '数据源类型（0-关系型数据源，1-文件数据源，2-服务型数据源）',
DRIVE_TYPE IS  '驱动程序类型（mysql、Db2……，excel、txt）',
DRIVE_CLASS IS  '驱动程序类',
CONN_URL IS  '连接URL',
DB_NAME IS  '数据库名',
USER_NAME IS  '用户名',
PASSWORD IS  '密码',
SRC_CHARACTER IS  '数据源字符集',
GOAL_CHARACTER IS  '数据源目标字符集',
VERIFY_TYPE IS  '验证类型（0-静态1-动态）',
MAX_CONN IS  '最大连接数',
CHECK_TYPE IS  '检验类型',
SENTERNCE IS  '检验语句',
TRAN_LEVEL IS  '事务隔离级别',
REF_ID IS  '引用标识符',
STATUS IS  '状态（0-创建，1-存草稿，2-分享，3-发布）',
INDEX_PATH IS  '索引路径',
ICONS IS  '图标',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 数据表表
CREATE TABLE DEV_DATA_TABLE(
  TABLE_ID  VARCHAR (32) NOT NULL,
  SOURCE_ID  varchar(32) NOT NULL,
  SOURCE_NAME  varchar(255) NOT NULL,
  TABLE_NAME  VARCHAR (255),
  TABLE_DESC  VARCHAR (255),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_DATA_TABLE PRIMARY KEY (TABLE_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_DATA_TABLE IS '开发中心-数据表表';
 COMMENT ON DEV_DATA_TABLE(
TABLE_ID IS  '表编号',
SOURCE_ID IS  '数据源编号',
SOURCE_NAME IS  '数据源名称',
TABLE_NAME IS  '表名称',
TABLE_DESC IS  '表描述',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 数据源列表
CREATE TABLE DEV_DATA_COLUMN(
  COLUMN_ID  VARCHAR (32) NOT NULL,
  TABLE_ID  VARCHAR (32) NOT NULL,
  SOURCE_ID  varchar(32) NOT NULL,
  TABLE_NAME  VARCHAR (100),
  TABLE_DESC  VARCHAR (255),
  COLUMN_NAME  VARCHAR (100),
  COLUMN_DESC  VARCHAR (255),
  COLUMN_TYPE  VARCHAR (50),
  COLUMN_ORDER  DECIMAL(5),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_DATA_COLUMN PRIMARY KEY (COLUMN_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_DATA_COLUMN IS '开发中心-数据列表';
 COMMENT ON DEV_DATA_COLUMN(
COLUMN_ID IS  '列编号',
TABLE_ID IS  '表编号',
SOURCE_ID IS  '数据源编号',
TABLE_NAME IS  '表名称',
TABLE_DESC IS  '表描述',
COLUMN_NAME IS  '列名称',
COLUMN_DESC IS  '列描述',
COLUMN_TYPE IS  '列类型',
COLUMN_ORDER IS  '字段顺序',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 参数信息表
CREATE TABLE DEV_PARAM_PARAMETER(
  PARAMETER_ID  VARCHAR (32) NOT NULL,
  PARAMETER_NAME  VARCHAR (200) NOT NULL,
  PARAMETER_DESC  VARCHAR (200),
  PARAMETER_TYPE  VARCHAR (2),
  DATA_TYPE  VARCHAR (2),
  COMPONENT_TYPE  VARCHAR (3),
  COMPONENT_WIDTH  DECIMAL(5),
  COMPONENT_HEIGHT  DECIMAL(5),
  CONTENT_WIDTH  DECIMAL(5),
  CONTENT_HEIGHT  DECIMAL(5),
  DEFAULT_VALUE  VARCHAR (300),
  DEFAULT_EXPR  VARCHAR (300),
  SELECTED_VALUE  VARCHAR (200),
  SELECTED_EXPR  VARCHAR (500),
  SELECTED_VAL_TYPE  VARCHAR (2),
  LINK_TABLE  VARCHAR (200),
  STATUS  varchar(1),
  INDEX_PATH  varchar(32),
  ICONS  varchar(300),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_PARAM_PARAMETER PRIMARY KEY (PARAMETER_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_PARAM_PARAMETER IS '开发中心-参数信息表';
 COMMENT ON DEV_PARAM_PARAMETER(
PARAMETER_ID IS  '参数编号',
PARAMETER_NAME IS  '参数名称',
PARAMETER_DESC IS  '参数描述',
PARAMETER_TYPE IS  '参数类型(0-全局参数 1-私有参数)',
DATA_TYPE IS  '数据类型，0字符串，1整形 ，2浮点型，3日期，4时间，5日期时间',
COMPONENT_TYPE IS  '控件类型：0文本框，1勾选框，2下拉框，3树形对话框，4日期时间控件',
COMPONENT_WIDTH IS  '控件宽度',
COMPONENT_HEIGHT IS  '控件高度',
CONTENT_WIDTH IS  '控件下拉框宽度',
CONTENT_HEIGHT IS  '控件下拉框高度',
DEFAULT_VALUE IS  '默认值',
DEFAULT_EXPR IS  '默认值表达式',
SELECTED_VALUE IS  '备选值',
SELECTED_EXPR IS  '备选值表达式',
SELECTED_VAL_TYPE IS  '备选值类型',
LINK_TABLE IS  '参数所属表',
STATUS IS  '状态（0-创建，1-存草稿，2-分享，3-发布）',
INDEX_PATH IS  '索引路径',
ICONS IS  '图标',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 查询主信息表
CREATE TABLE DEV_INQUIRY_MAIN(
  INQUIRY_ID  VARCHAR (32) NOT NULL,
  INQUIRY_NAME  VARCHAR (200) NOT NULL,
  INQUIRY_TYPE  VARCHAR (2),
  SOURCE_ID  varchar(32),
  ORIG_SQL  VARCHAR (10000),
  EXECUTE_SQL  VARCHAR (10000),
  STATUS  VARCHAR (1),
  INDEX_PATH  varchar(32),
  ICONS  varchar(300),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_INQUIRY_MAIN PRIMARY KEY (INQUIRY_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_INQUIRY_MAIN IS '开发中心-查询主信息表';
 COMMENT ON DEV_INQUIRY_MAIN(
INQUIRY_ID IS  '查询编号',
INQUIRY_NAME IS  '查询名称',
INQUIRY_TYPE IS  '查询类型（00-sql，01-可视化，10-excel，11-txt，20-服务）',
SOURCE_ID IS  '数据源编号',
ORIG_SQL IS  '原始SQL(文件名、服务名)',
EXECUTE_SQL IS  '执行SQL（文件路径、服务信息）',
STATUS IS  '状态（0-创建，1-存草稿，2-分享，3-发布）',
INDEX_PATH IS  '索引路径',
ICONS IS  '图标',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 查询表信息表
CREATE TABLE DEV_INQUIRY_TABLE(
  TABLE_ID  VARCHAR (32) NOT NULL,
  INQUIRY_ID  VARCHAR (32) NOT NULL,
  TABLE_NAME  VARCHAR (100) NOT NULL,
  TABLE_ALIAS  VARCHAR (100),
  TABLE_DESC  VARCHAR (200),
  TABLE_ORDER  DECIMAL(5),
  TABLE_TYPE  VARCHAR (20),
  TABLE_SCHEMA  VARCHAR (50),
  REL_TABLE  VARCHAR (100),
  REL_TYPE  VARCHAR (5),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_INQUIRY_TABLE PRIMARY KEY (TABLE_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_INQUIRY_TABLE IS '开发中心-查询表信息表';
 COMMENT ON DEV_INQUIRY_TABLE(
TABLE_ID IS  '查询表编号',
INQUIRY_ID IS  '查询编号',
TABLE_NAME IS  '表名称',
TABLE_ALIAS IS  '表别名',
TABLE_DESC IS  '表描述',
TABLE_ORDER IS  '表顺序',
TABLE_TYPE IS  '表类型',
TABLE_SCHEMA IS  '所属表别名',
REL_TABLE IS  '关联表名称',
REL_TYPE IS  '关联方式（0-内关联，1-左关联，2-右关联）',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 查询输出列信息表
CREATE TABLE DEV_INQUIRY_COLUMN(
  COLUMN_ID  VARCHAR (32) NOT NULL,
  INQUIRY_ID  VARCHAR (32) NOT NULL,
  COLUMN_NAME  VARCHAR (100),
  COLUMN_ALIAS  VARCHAR (100),
  COLUMN_DESC  VARCHAR (200),
  COLUMN_ORDER  DECIMAL(5),
  COLUMN_TYPE  VARCHAR (20),
  COLUMN_HIDDEN  VARCHAR (2),
  TABLE_ALIAS  VARCHAR (1),
  IS_NUMBER  VARCHAR (1),
  IS_AGGREGATE  VARCHAR (1),
  AGGREGATE_TYPE  VARCHAR (1),
  AGGREGATE  VARCHAR (100),
  IS_GROUP_COLUMN  VARCHAR (1),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_INQUIRY_COLUMN PRIMARY KEY (COLUMN_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_INQUIRY_COLUMN IS '开发中心-查询输出列信息表';
 COMMENT ON DEV_INQUIRY_COLUMN(
COLUMN_ID IS  '列编号',
INQUIRY_ID IS  '查询编号',
COLUMN_NAME IS  '字段名称',
COLUMN_ALIAS IS  '字段别名',
COLUMN_DESC IS  '字段描述',
COLUMN_ORDER IS  '字段顺序',
COLUMN_TYPE IS  '字段类型',
COLUMN_HIDDEN IS  '字段隐藏（1-隐藏，0-显示）',
TABLE_ALIAS IS  '所属表别名',
IS_NUMBER IS  '是否数字类型（1-是，0-否）',
IS_AGGREGATE IS  '是否聚合函数0否1是',
AGGREGATE_TYPE IS  '聚合函数类型0一般1特殊',
AGGREGATE IS  '聚合函数',
IS_GROUP_COLUMN IS  '是否分组字段（0-否，1-是）',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 查询条件信息表
CREATE TABLE DEV_INQUIRY_CONDITION(
  COND_ID  VARCHAR (32) NOT NULL,
  INQUIRY_ID  VARCHAR (32) NOT NULL,
  TABLE_ID  VARCHAR (32),
  COND_TYPE  VARCHAR (2),
  COND_PREFIX  VARCHAR (20),
  COND_COLUMN  VARCHAR (100),
  COND_SYMBOL  VARCHAR (20),
  COND_VALUE  VARCHAR (200),
  COND_POSTFIX  VARCHAR (20),
  COND_ORDER  DECIMAL(5),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_INQUIRY_CONDITION PRIMARY KEY (COND_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_INQUIRY_CONDITION IS '开发中心-查询条件信息表';
 COMMENT ON DEV_INQUIRY_CONDITION(
COND_ID IS  '条件编号',
INQUIRY_ID IS  '查询编号',
TABLE_ID IS  '表编号',
COND_TYPE IS  '条件类型（0-常量筛选条件，1-关联条件，2-参数条件，3-权限过滤）',
COND_PREFIX IS  '表达式前缀',
COND_COLUMN IS  '条件表达式',
COND_SYMBOL IS  '条件表达式运算符',
COND_VALUE IS  '条件表达式值',
COND_POSTFIX IS  '表达式后缀',
COND_ORDER IS  '条件排序',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 图表定义主表
CREATE TABLE DEV_REPORT_DEFINE(
  CHARTS_ID  VARCHAR (32) NOT NULL,
  CHARTS_TYPE  VARCHAR (50) NOT NULL,
  CHARTS_NAME  VARCHAR (200),
  CHARTS_CATEGORY  VARCHAR (32),
  ICONS  VARCHAR (300),
  CHARTS_DIM_MIN  DECIMAL(5),
  CHARTS_DIM_MAX  DECIMAL(5),
  CHARTS_MEA_MIN  DECIMAL(5),
  CHARTS_MEA_MAX  DECIMAL(5),
  CHARTS_DATE_NUM  DECIMAL(5),
  CHARTS_PLACE_NUM  DECIMAL(5),
  COMPONENT_NAME  VARCHAR (100),
  CHART_ORDER  INT,
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_REPORT_DEFINE PRIMARY KEY (CHARTS_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_REPORT_DEFINE IS '开发中心-图表定义主表';
 COMMENT ON DEV_REPORT_DEFINE(
CHARTS_ID IS  '图表编号',
CHARTS_TYPE IS  '图表类型',
CHARTS_NAME IS  '图表名称',
CHARTS_CATEGORY IS  '图表分类',
ICONS IS  '图标',
CHARTS_DIM_MIN IS  '维度最小数',
CHARTS_DIM_MAX IS  '维度最大数',
CHARTS_MEA_MIN IS  '度量最小数',
CHARTS_MEA_MAX IS  '度量最大数',
CHARTS_DATE_NUM IS  '日期数量',
CHARTS_PLACE_NUM IS  '地理数量',
COMPONENT_NAME IS  '组件名称',
CHART_ORDER IS  '排序',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 图表定义_国际化表
CREATE TABLE DEV_REPORT_DEFINE_I18N(
  I18N_ID  VARCHAR (32) NOT NULL,
  CHARTS_ID  VARCHAR (32) NOT NULL,
  LANGUAGE  VARCHAR (10),
  COUNTRY  VARCHAR (10),
  CHARTS_NAME  VARCHAR (200),
  CHARTS_COMMENT  VARCHAR (500),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_REPORT_DEFINE_I18N PRIMARY KEY (I18N_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_REPORT_DEFINE_I18N IS '开发中心-图表定义国际化表';
 COMMENT ON DEV_REPORT_DEFINE_I18N(
I18N_ID IS  '国际化编号',
CHARTS_ID IS  '图表编号',
LANGUAGE IS  '语言',
COUNTRY IS  '国家',
CHARTS_NAME IS  '图表名称',
CHARTS_COMMENT IS  '图表说明',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 图表定义属性表
CREATE TABLE DEV_REPORT_ATTR_DEF(
  CHARTS_ATTR_ID  VARCHAR (32) NOT NULL,
  CHARTS_ID  VARCHAR (32),
  PARENT_ATTR_ID  VARCHAR (32),
  CHARTS_ATTR_TYPE  VARCHAR (20),
  CHARTS_ATTR_NAME  VARCHAR (100),
  CHARTS_ATTR_VALUE  VARCHAR (200),
  CHARTS_ATTR_DESC  VARCHAR (200),
  CHARTS_ATTR_ORDER  DECIMAL(5),
  COMPONENT_TYPE  VARCHAR (50),
  COMPONENT_OPTIONS  VARCHAR (500),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_REPORT_ATTR_DEF PRIMARY KEY (CHARTS_ATTR_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_REPORT_ATTR_DEF IS '开发中心-图表定义属性表';
 COMMENT ON DEV_REPORT_ATTR_DEF(
CHARTS_ATTR_ID IS  '图表属性编号',
CHARTS_ID IS  '图表编号',
PARENT_ATTR_ID IS  '上级属性ID',
CHARTS_ATTR_TYPE IS  '图表属性类型(String,Object,ARRAY)',
CHARTS_ATTR_NAME IS  '图表属性名称',
CHARTS_ATTR_VALUE IS  '图表属性值',
CHARTS_ATTR_DESC IS  '图表属性描述',
CHARTS_ATTR_ORDER IS  '属性排序',
COMPONENT_TYPE IS  '组件类型',
COMPONENT_OPTIONS IS  '可选值',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 图表定义属性_国际化表
CREATE TABLE DEV_REPORT_ATTR_I18N(
  I18N_ID  VARCHAR (32) NOT NULL,
  CHARTS_ATTR_ID  VARCHAR (32) NOT NULL,
  LANGUAGE  VARCHAR (10),
  COUNTRY  VARCHAR (10),
  CHARTS_ATTR_DESC  VARCHAR (200),
  COMPONENT_OPTIONS  VARCHAR (500),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_REPORT_ATTR_I18N PRIMARY KEY (I18N_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_REPORT_ATTR_I18N IS '开发中心-图表定义属性国际化表';
 COMMENT ON DEV_REPORT_ATTR_I18N(
I18N_ID IS  '图表属性编号',
CHARTS_ATTR_ID IS  '图表属性编号',
LANGUAGE IS  '语言',
COUNTRY IS  '国家',
CHARTS_ATTR_DESC IS  '图表属性描述',
COMPONENT_OPTIONS IS  '可选值',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 图表定义绑定表
CREATE TABLE DEV_REPORT_BIND_DEF(
  CHARTS_BIND_ID  VARCHAR (32) NOT NULL,
  CHARTS_ID  VARCHAR (32),
  BIND_NAME  VARCHAR (100),
  BIND_TYPE  VARCHAR (20),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_REPORT_BIND_DEF PRIMARY KEY (CHARTS_BIND_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_REPORT_BIND_DEF IS '开发中心-图表定义绑定表';
 COMMENT ON DEV_REPORT_BIND_DEF(
CHARTS_BIND_ID IS  '绑定编号',
CHARTS_ID IS  '图表编号',
BIND_NAME IS  '绑定名称',
BIND_TYPE IS  '绑定数据类型（0-任意，1-数字）',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 图表信息主表
CREATE TABLE DEV_REPORT_INFO(
  REPORT_ID  VARCHAR (32) NOT NULL,
  REPORT_NAME  VARCHAR (200),
  REPORT_DESC  VARCHAR (200),
  CHARTS_ID  VARCHAR (32),
  CHARTS_TYPE  VARCHAR (2),
  INQUIRY_ID  VARCHAR (32),
  REPORT  text,
  CHARTS_DIM_MIN  DECIMAL(5),
  CHARTS_DIM_MAX  DECIMAL(5),
  CHARTS_MEA_MIN  DECIMAL(5),
  CHARTS_MEA_MAX  DECIMAL(5),
  STATUS  VARCHAR (1),
  INDEX_PATH  varchar(32),
  ICONS  varchar(300),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_REPORT_INFO PRIMARY KEY (REPORT_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_REPORT_INFO IS '开发中心-图表信息主表';
 COMMENT ON DEV_REPORT_INFO(
REPORT_ID IS  '报表编号',
REPORT_NAME IS  '报表名称',
REPORT_DESC IS  '报表描述',
CHARTS_ID IS  '图表编号',
CHARTS_TYPE IS  '图表类型',
INQUIRY_ID IS  '查询编号',
REPORT IS  '报表内容（固定报表）',
CHARTS_DIM_MIN IS  '维度最小数',
CHARTS_DIM_MAX IS  '维度最大数',
CHARTS_MEA_MIN IS  '度量最小数',
CHARTS_MEA_MAX IS  '度量最大数',
STATUS IS  '状态（0-创建，1-存草稿，2-分享，3-发布）',
INDEX_PATH IS  '索引路径',
ICONS IS  '图标',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 图表信息属性表
CREATE TABLE DEV_REPORT_ATTR_INFO(
  REPORT_ATTR_ID  VARCHAR (32) NOT NULL,
  REPORT_ID  VARCHAR (32) NOT NULL,
  CHARTS_ATTR_ID  VARCHAR (32),
  CHARTS_ID  VARCHAR (32),
  PARENT_ATTR_ID  VARCHAR (32),
  CHARTS_ATTR_TYPE  VARCHAR (20),
  CHARTS_ATTR_NAME  VARCHAR (100),
  CHARTS_ATTR_VALUE  VARCHAR (200),
  CHARTS_ATTR_DESC  VARCHAR (200),
  COMPONENT_TYPE  VARCHAR (50),
  COMPONENT_OPTIONS  VARCHAR (500),
  CHARTS_ATTR_ORDER  DECIMAL(5),
  IS_CUSTOM  VARCHAR (1),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_REPORT_ATTR_INFO PRIMARY KEY (REPORT_ATTR_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_REPORT_ATTR_INFO IS '开发中心-图表信息属性表';
 COMMENT ON DEV_REPORT_ATTR_INFO(
REPORT_ATTR_ID IS  '报表属性编号',
REPORT_ID IS  '报表编号',
CHARTS_ATTR_ID IS  '图表属性编号',
CHARTS_ID IS  '图表编号',
PARENT_ATTR_ID IS  '上级属性ID',
CHARTS_ATTR_TYPE IS  '图表属性类型(String,Object,ARRAY)',
CHARTS_ATTR_NAME IS  '图表属性名称',
CHARTS_ATTR_VALUE IS  '图表属性值',
CHARTS_ATTR_DESC IS  '图表属性描述',
COMPONENT_TYPE IS  '组件类型',
COMPONENT_OPTIONS IS  '可选值',
CHARTS_ATTR_ORDER IS  '属性排序',
IS_CUSTOM IS  '是否自定义',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 图表信息绑定表
CREATE TABLE DEV_REPORT_BIND_INFO(
  REPORT_BIND_ID  VARCHAR (32) NOT NULL,
  REPORT_ID  VARCHAR (32) NOT NULL,
  CHARTS_BIND_ID  VARCHAR (32) NOT NULL,
  CHARTS_ID  VARCHAR (32),
  BIND_NAME  VARCHAR (100),
  BIND_TYPE  VARCHAR (20),
  BIND_VALUE  VARCHAR (200),
  BIND_DESC  VARCHAR (200),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_REPORT_BIND_INFO PRIMARY KEY (REPORT_BIND_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_REPORT_BIND_INFO IS '开发中心-图表定义绑定表';
 COMMENT ON DEV_REPORT_BIND_INFO(
REPORT_BIND_ID IS  '报表绑定编号',
REPORT_ID IS  '报表编号',
CHARTS_BIND_ID IS  '图表绑定编号',
CHARTS_ID IS  '图表编号',
BIND_NAME IS  '绑定名称',
BIND_TYPE IS  '绑定数据类型（0-任意，1-数字）',
BIND_VALUE IS  '绑定值',
BIND_DESC IS  '绑定值描述',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 图表输出列信息表
CREATE TABLE DEV_REPORT_COLUMN(
  REPORT_COLUMN_ID  VARCHAR (32) NOT NULL,
  REPORT_ID  VARCHAR (32) NOT NULL,
  INQUIRY_ID  VARCHAR (32) NOT NULL,
  COLUMN_NAME  VARCHAR (100),
  COLUMN_ALIAS  VARCHAR (100),
  COLUMN_DESC  VARCHAR (200),
  COLUMN_ORDER  DECIMAL(5),
  COLUMN_TYPE  VARCHAR (20),
  COLUMN_BIND  VARCHAR (50),
  IS_NUMBER  VARCHAR (1),
  IS_AGGREGATE  VARCHAR (1),
  AGGREGATE_TYPE  VARCHAR (1),
  AGGREGATE  VARCHAR (100),
  IS_GROUP_COLUMN  VARCHAR (1),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_REPORT_COLUMN PRIMARY KEY (REPORT_COLUMN_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_REPORT_COLUMN IS '开发中心-图表输出列信息表';
 COMMENT ON DEV_REPORT_COLUMN(
REPORT_COLUMN_ID IS  '报表列编号',
REPORT_ID IS  '报表编号',
INQUIRY_ID IS  '查询编号',
COLUMN_NAME IS  '字段名称',
COLUMN_ALIAS IS  '字段别名',
COLUMN_DESC IS  '字段描述',
COLUMN_ORDER IS  '字段顺序',
COLUMN_TYPE IS  '字段类型',
COLUMN_BIND IS  '字段绑定(row:行，col：列，value：值)',
IS_NUMBER IS  '是否度量（1-是，0-否）',
IS_AGGREGATE IS  '是否聚合函数0否1是',
AGGREGATE_TYPE IS  '聚合函数类型0一般1特殊',
AGGREGATE IS  '聚合函数',
IS_GROUP_COLUMN IS  '是否分组字段（0-否，1-是）',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 图表信息参数表
CREATE TABLE DEV_REPORT_PARAM_INFO(
  REPORT_PARAM_ID  VARCHAR (32) NOT NULL,
  REPORT_ID  VARCHAR (32) NOT NULL,
  PARAMETER_ID  VARCHAR (32),
  COLUMN_ALIAS  VARCHAR (100),
  INQUIRY_ID  VARCHAR (32),
  COND_TYPE  VARCHAR (2),
  COND_PREFIX  VARCHAR (20),
  COND_COLUMN  VARCHAR (100),
  COND_SYMBOL  VARCHAR (20),
  COND_VALUE  VARCHAR (200),
  COND_POSTFIX  VARCHAR (20),
  COND_REQUIRED  VARCHAR (10),
  ICONS  varchar(300),
  COMPONENT_TYPE  VARCHAR (50),
  COMPONENT_OPTIONS  VARCHAR (500),
  CHARTS_ATTR_ORDER  DECIMAL(5),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_REPORT_PARAM_INFO PRIMARY KEY (REPORT_PARAM_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_REPORT_PARAM_INFO IS '开发中心-图表信息参数表';
 COMMENT ON DEV_REPORT_PARAM_INFO(
REPORT_PARAM_ID IS  '报表参数编号',
REPORT_ID IS  '报表编号',
PARAMETER_ID IS  '参数编号',
COLUMN_ALIAS IS  '字段别名',
INQUIRY_ID IS  '查询编号',
COND_TYPE IS  '条件类型（0-常量筛选条件，1-关联条件，2-参数条件，3-权限过滤）',
COND_PREFIX IS  '表达式前缀',
COND_COLUMN IS  '条件表达式',
COND_SYMBOL IS  '条件表达式运算符',
COND_VALUE IS  '条件表达式值',
COND_POSTFIX IS  '表达式后缀',
COND_REQUIRED IS  '是否必输',
ICONS IS  '图标',
COMPONENT_TYPE IS  '组件类型',
COMPONENT_OPTIONS IS  '可选值',
CHARTS_ATTR_ORDER IS  '属性排序',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 分析布局定义表
CREATE TABLE DEV_ANALYSIS_LAYOUT_DEF(
  LAYOUT_ID  VARCHAR (32) NOT NULL,
  ITEM_COUNT  DECIMAL(5) NOT NULL,
  WIDTH  VARCHAR (20),
  HEIGHT  VARCHAR (20),
  FLEX_DIRECTION  VARCHAR (50),
  FLEX_WRAP  VARCHAR (50),
  JUSTIFY_CONTENT  VARCHAR (50),
  ALIGN_ITEMS  VARCHAR (50),
  ALIGN_CONTENT  VARCHAR (50),
  EXT_ATTRIBUTS  VARCHAR (500),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_ANALYSIS_LAYOUT_DEF PRIMARY KEY (LAYOUT_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_ANALYSIS_LAYOUT_DEF IS '开发中心-分析布局定义表';
 COMMENT ON DEV_ANALYSIS_LAYOUT_DEF(
LAYOUT_ID IS  '布局编号',
ITEM_COUNT IS  '容纳数量',
WIDTH IS  '容器宽度',
HEIGHT IS  '容器高度',
FLEX_DIRECTION IS  '项目的排列方向(row | row-reverse | column | column-reverse;)',
FLEX_WRAP IS  '项目换行方式（nowrap | wrap | wrap-reverse;）',
JUSTIFY_CONTENT IS  '项目水平对齐方式（flex-start | flex-end | center | space-between | space-around;）',
ALIGN_ITEMS IS  '项目垂直对齐方式（flex-start | flex-end | center | baseline | stretch;）',
ALIGN_CONTENT IS  '项目多向对齐方式（flex-start | flex-end | center | space-between | space-around | stretch;）',
EXT_ATTRIBUTS IS  '扩展属性',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 分析布局项目定义表
CREATE TABLE DEV_ANALYSIS_LAYOUT_ITEM_DEF(
  ITEM_ID  VARCHAR (32) NOT NULL,
  LAYOUT_ID  VARCHAR (32) NOT NULL,
  ITEM_ORDER  DECIMAL(5),
  WIDTH  VARCHAR (20),
  HEIGHT  VARCHAR (20),
  FLEX_GROW  VARCHAR (50),
  FLEX_SHRINK  VARCHAR (50),
  FLEX_BASIS  VARCHAR (50),
  ALIGN_SELF  VARCHAR (50),
  EXT_ATTRIBUTS  VARCHAR (500),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_ANALYSIS_LAYOUT_ITEM_DEF PRIMARY KEY (ITEM_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_ANALYSIS_LAYOUT_ITEM_DEF IS '开发中心-分析布局项目定义表';
 COMMENT ON DEV_ANALYSIS_LAYOUT_ITEM_DEF(
ITEM_ID IS  '项目编号',
LAYOUT_ID IS  '布局编号',
ITEM_ORDER IS  '项目排序',
WIDTH IS  '项目宽度',
HEIGHT IS  '项目高度',
FLEX_GROW IS  '项目的放大比例（默认为0）',
FLEX_SHRINK IS  '项目的缩小比例(默认为1)',
FLEX_BASIS IS  '项目占据的主轴空间（flex-start | flex-end | center | space-between | space-around | stretch;）',
ALIGN_SELF IS  '项目对齐方式(auto | flex-start | flex-end | center | baseline | stretch;)',
EXT_ATTRIBUTS IS  '扩展属性',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 分析信息表
CREATE TABLE DEV_ANALYSIS_INFO(
  ANALYSIS_ID  VARCHAR (32) NOT NULL,
  ANALYSIS_TYPE  VARCHAR (32) NOT NULL,
  ANALYSIS_NAME  VARCHAR (50),
  LAYOUT_ID  VARCHAR (32),
  ITEM_COUNT  DECIMAL(5),
  WIDTH  VARCHAR (20),
  HEIGHT  VARCHAR (20),
  TOP  VARCHAR (20),
  LEFT  VARCHAR (20),
  FLEX_WRAP  VARCHAR (50),
  JUSTIFY_CONTENT  VARCHAR (50),
  ALIGN_ITEMS  VARCHAR (50),
  ALIGN_CONTENT  VARCHAR (50),
  EXT_ATTRIBUTS  VARCHAR (500),
  STATUS  VARCHAR (1),
  INDEX_PATH  varchar(32),
  ICONS  varchar(300),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_ANALYSIS_INFO PRIMARY KEY (ANALYSIS_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_ANALYSIS_INFO IS '开发中心-分析信息表';
 COMMENT ON DEV_ANALYSIS_INFO(
ANALYSIS_ID IS  '分析编号',
ANALYSIS_TYPE IS  '分析类型（0-单表分析，1-组合分析，2-仪表分析……）',
ANALYSIS_NAME IS  '分析名称',
LAYOUT_ID IS  '布局编号',
ITEM_COUNT IS  '容纳数量',
WIDTH IS  '容器宽度',
HEIGHT IS  '容器高度',
TOP IS  '上边距',
LEFT IS  '左边距',
FLEX_WRAP IS  '项目换行方式（nowrap | wrap | wrap-reverse;）',
JUSTIFY_CONTENT IS  '项目水平对齐方式（flex-start | flex-end | center | space-between | space-around;）',
ALIGN_ITEMS IS  '项目垂直对齐方式（flex-start | flex-end | center | baseline | stretch;）',
ALIGN_CONTENT IS  '项目多向对齐方式（flex-start | flex-end | center | space-between | space-around | stretch;）',
EXT_ATTRIBUTS IS  '扩展属性',
STATUS IS  '状态（0-创建，1-存草稿，2-分享，3-发布）',
INDEX_PATH IS  '索引路径',
ICONS IS  '图标',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;
-- 分析项目信息表
CREATE TABLE DEV_ANALYSIS_ITEM_INFO(
  ANALYSIS_ITEM_ID  VARCHAR (32) NOT NULL,
  ANALYSIS_ID  VARCHAR (32) NOT NULL,
  REPORT_ID  VARCHAR (32) NOT NULL,
  ITEM_ID  VARCHAR (32),
  LAYOUT_ID  VARCHAR (32),
  ITEM_ORDER  DECIMAL(5),
  WIDTH  VARCHAR (20),
  HEIGHT  VARCHAR (20),
  TOP_PAD  VARCHAR (20),
  LEFT_PAD  VARCHAR (20),
  FLEX_GROW  VARCHAR (50),
  FLEX_SHRINK  VARCHAR (50),
  FLEX_BASIS  VARCHAR (50),
  ALIGN_SELF  VARCHAR (50),
  EXT_ATTRIBUTS  VARCHAR (500),
  CRT_USER_CODE  VARCHAR (32),
  CRT_ORG_CODE  VARCHAR (32),
  CRT_DATE  TIMESTAMP,
  UPD_USER_CODE  VARCHAR (32),
  UPD_ORG_CODE  VARCHAR (32),
  UPD_DATE  TIMESTAMP,
CONSTRAINT DEV_ANALYSIS_ITEM_INFO PRIMARY KEY (ANALYSIS_ITEM_ID)
) IN TS_PAMS_PROD INDEX IN TS_PAMS_PROD_IND;
 COMMENT ON TABLE DEV_ANALYSIS_ITEM_INFO IS '开发中心-分析项目信息表';
 COMMENT ON DEV_ANALYSIS_ITEM_INFO(
ANALYSIS_ITEM_ID IS  '分析项目编号',
ANALYSIS_ID IS  '分析编号',
REPORT_ID IS  '报表编号',
ITEM_ID IS  '项目编号',
LAYOUT_ID IS  '布局编号',
ITEM_ORDER IS  '项目排序',
WIDTH IS  '宽度',
HEIGHT IS  '高度',
TOP_PAD IS  '上边距',
LEFT_PAD IS  '左边距',
FLEX_GROW IS  '项目的放大比例（默认为0）',
FLEX_SHRINK IS  '项目的缩小比例(默认为1)',
FLEX_BASIS IS  '项目占据的主轴空间（flex-start | flex-end | center | space-between | space-around | stretch;）',
ALIGN_SELF IS  '项目对齐方式(auto | flex-start | flex-end | center | baseline | stretch;)',
EXT_ATTRIBUTS IS  '扩展属性',
CRT_USER_CODE IS  '创建人',
CRT_ORG_CODE IS  '创建机构',
CRT_DATE IS  '创建日期',
UPD_USER_CODE IS  '修改人',
UPD_ORG_CODE IS  '修改机构',
UPD_DATE IS  '修改日期'
);
COMMIT;

