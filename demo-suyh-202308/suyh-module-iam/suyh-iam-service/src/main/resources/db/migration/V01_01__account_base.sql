
-- DROP TABLE  if exists suyh_iam_user_base;
CREATE TABLE suyh_iam_user_base  (
    id bigint NOT NULL COMMENT '由业务系统生成全局唯一的ID值',
    nick_name varchar(255) NOT NULL,
    age int NULL,
    mobile varchar(255) NULL COMMENT '手机号码',

    created_by bigint NULL COMMENT '创建人',
    created_time datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    updated_by bigint NOT NULL COMMENT '修改人',
    updated_time datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    PRIMARY KEY (id)
) ENGINE = InnoDB COMMENT '用户主表';

-- DROP TABLE  if exists suyh_iam_user_confidential;
CREATE TABLE suyh_iam_user_confidential (
    id bigint NOT NULL COMMENT '唯一主键，该值必须与user_base 表中的完全一致，且数据一致。',
    login_account varchar(64) NOT NULL COMMENT '唯一登录帐号',
    login_pwd varchar(256) NOT NULL COMMENT '登录密码密文',
    created_time datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    PRIMARY KEY (id)
) ENGINE = InnoDB COMMENT '用户辅助表-与主表一一映射，主要存储一些私密数据';



