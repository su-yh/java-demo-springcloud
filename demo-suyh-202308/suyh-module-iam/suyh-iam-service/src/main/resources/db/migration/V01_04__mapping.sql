
-- DROP TABLE  if exists suyh_iam_mapping_user_role;
CREATE TABLE suyh_iam_mapping_user_role  (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    user_id BIGINT NOT NULL COMMENT '映射用户表的主键ID',
    role_code varchar(64) NOT NULL COMMENT '租户key',
    PRIMARY KEY (id)
) ENGINE = InnoDB COMMENT '用户与角色的映射关系，一个用户可以有多个角色';
ALTER TABLE suyh_iam_mapping_user_role
    ADD INDEX index_user_id(user_id) USING BTREE COMMENT '用户ID 的普通索引';


-- DROP TABLE  if exists suyh_iam_mapping_user_tenant;
CREATE TABLE suyh_iam_mapping_user_tenant  (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    user_id BIGINT NOT NULL COMMENT '映射用户表的主键ID',
    tenant_id varchar(64) NOT NULL COMMENT '租户key',
    PRIMARY KEY (id)
) ENGINE = InnoDB COMMENT '用户与租户的映射关系，一个用户可以有多个租户';
ALTER TABLE suyh_iam_mapping_user_tenant
    ADD INDEX index_user_id(user_id) USING BTREE COMMENT '用户ID 的普通索引';

