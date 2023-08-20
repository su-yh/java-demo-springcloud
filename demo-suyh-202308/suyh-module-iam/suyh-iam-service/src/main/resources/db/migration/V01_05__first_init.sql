
-- 初始化系统管理员(id: 2419)的基础信息
INSERT INTO suyh_iam_user_base(id, nick_name, age, mobile, created_by, updated_by)
    VALUE(2419, '系统管理员', null, null, 2419, 2419);

-- 初始化系统管理员(id: 2419)的帐号信息
INSERT INTO suyh_iam_user_confidential(id, login_account, login_pwd)
    VALUE(2419, 'system-admin', 'system-admin');

-- 在整个系统添加一个默认的系统租户(id: 5729)
INSERT INTO suyh_iam_tenant(tenant_id, tenant_name, tenant_description)
VALUE('system', 'system', '系统租户');

-- 为系统租户添加系统管理员角色
INSERT INTO suyh_iam_role(role_code, role_name, owner_tenant_id)
    VALUE('system-manager', '系统管理员', 'system');

-- 为系统管理员用户添加系统管理员角色
INSERT INTO suyh_iam_mapping_user_role(user_id, role_code)
    VALUE(2419, 'system-manager');

-- 为系统管理员用户绑定系统租户
INSERT INTO suyh_iam_mapping_user_tenant(user_id, tenant_id)
    VALUE(2419, 'system');





