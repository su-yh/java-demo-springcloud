-- 我想给自增主键和初始值一个随机数，但是似乎语法不允许，它只接受一个常量值：
-- ALTER TABLE suyh_iam_tenant AUTO_INCREMENT=FLOOR(RAND()*(100000)+10000);
-- DROP TABLE  if exists suyh_iam_tenant;
CREATE TABLE suyh_iam_tenant  (
    tenant_id varchar(64) NOT NULL COMMENT '租户key，大小写不敏感，一般为一串大写的字母，唯一索引，用来做业务的',
    tenant_name varchar(255) NOT NULL COMMENT '租户显示名称，一般与tenant_id 一致即可。',
    tenant_description varchar(4000) NULL COMMENT '自己租户的描述信息',
    PRIMARY KEY (tenant_id)
) ENGINE = InnoDB COMMENT '租户主表';



