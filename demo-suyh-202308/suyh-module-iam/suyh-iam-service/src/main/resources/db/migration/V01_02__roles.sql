
-- DROP TABLE  if exists suyh_iam_role;
CREATE TABLE suyh_iam_role (
    role_code VARCHAR(64) NOT NULL COMMENT '主键，用来做业务的，约定必须是英文且小写。',
    role_name varchar(255) NOT NULL COMMENT '该角色的功能描述',
    owner_tenant_id VARCHAR(64) NOT NULL COMMENT '该角色所属租户',
    PRIMARY KEY (role_code)
) ENGINE = InnoDB COMMENT '用户角色表: 角色必须与租户进行绑定';





