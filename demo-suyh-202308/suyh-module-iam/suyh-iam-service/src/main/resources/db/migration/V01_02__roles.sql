-- 约定"sys-" 或者"tenant-" 开头的不允许用户自己创建，用作系统保留角色。
-- DROP TABLE  if exists suyh_iam_role;
-- 系统自带，则说明可以在代码里面直接使用该常量字符串
CREATE TABLE suyh_iam_role (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    tenant_id VARCHAR(64) NOT NULL COMMENT '该角色所属租户',
    role_code VARCHAR(64) NOT NULL COMMENT '约定必须是英文且小写，一但创建不允许修改，但可以删除后重新创建。',
    role_name varchar(128) NOT NULL COMMENT '该角色功能的简单描述',
    role_description varchar(4000) NULL COMMENT '角色详细描述',
    system_role VARCHAR(32) NOT NULL COMMENT '是否系统自带角色',
    PRIMARY KEY (id)
) ENGINE = InnoDB COMMENT '用户角色表: 角色必须与租户进行绑定';

ALTER TABLE suyh_iam_role
    ADD UNIQUE INDEX index_tenant_role(tenant_id, role_code) USING BTREE COMMENT '租户ID 和角色的组合唯一索引';




