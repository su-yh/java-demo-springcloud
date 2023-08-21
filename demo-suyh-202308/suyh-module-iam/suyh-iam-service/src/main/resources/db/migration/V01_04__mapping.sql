
-- DROP TABLE  if exists suyh_iam_mapping_user_role;
CREATE TABLE suyh_iam_mapping_user_role  (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    tenant_id VARCHAR(64) NOT NULL COMMENT '所属租户',
    user_id BIGINT NOT NULL COMMENT '映射用户表的主键ID',
    role_code varchar(64) NOT NULL COMMENT '角色',
    PRIMARY KEY (id)
) ENGINE = InnoDB COMMENT '用户与角色的映射关系，一个用户可以有多个角色';
ALTER TABLE suyh_iam_mapping_user_role
    ADD UNIQUE INDEX index_tenant_user_role(tenant_id, user_id, role_code) USING BTREE COMMENT '租户用户普通索引';


-- DROP TABLE  if exists suyh_iam_mapping_user_tenant;
CREATE TABLE suyh_iam_mapping_user_tenant (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    tenant_id varchar(64) NOT NULL COMMENT '租户id',
    user_id BIGINT NOT NULL COMMENT '映射用户表的主键ID',
    PRIMARY KEY (id)
) ENGINE = InnoDB COMMENT '用户与租户的映射关系，一个用户可以有多个租户';
ALTER TABLE suyh_iam_mapping_user_tenant
    ADD INDEX index_user_id(user_id) USING BTREE COMMENT '用户ID 的普通索引';
ALTER TABLE suyh_iam_mapping_user_tenant
    ADD UNIQUE INDEX index_tenant_user(tenant_id, user_id) USING BTREE COMMENT '租户用户唯一索引';

