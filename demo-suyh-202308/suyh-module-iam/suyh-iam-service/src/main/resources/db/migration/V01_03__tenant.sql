-- 我想给自增主键和初始值一个随机数，但是似乎语法不允许，它只接受一个常量值：
-- ALTER TABLE suyh_iam_tenant AUTO_INCREMENT=FLOOR(RAND()*(100000)+10000);
-- 租户也约定以"eel-" 开头的为系统内置租户，不允许用户创建。
-- DROP TABLE  if exists suyh_iam_tenant;
CREATE TABLE suyh_iam_tenant  (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    tenant_id varchar(64) NOT NULL COMMENT '租户id，大小写不敏感，一般为一串大写的字母，唯一索引，用来做业务的。用户可以自己填写，否则系统自动生成。',
    tenant_name varchar(255) NOT NULL COMMENT '租户显示名称，一般与tenant_id 一致即可。',
    tenant_description varchar(4000) NULL COMMENT '自己租户的描述信息',
    PRIMARY KEY (id)
) ENGINE = InnoDB COMMENT '租户主表';

ALTER TABLE suyh_iam_tenant
    ADD UNIQUE INDEX index_tenant_id(tenant_id) USING BTREE COMMENT '租户ID 的唯一索引';


