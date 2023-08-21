
-- 初始化系统管理员(id: 2419)的基础信息
INSERT INTO suyh_iam_user_base(id, nick_name, age, mobile, created_by, updated_by)
    VALUE(2419, '系统管理员', null, null, 2419, 2419);

-- 初始化系统管理员(id: 2419)的帐号信息
INSERT INTO suyh_iam_user_confidential(id, login_account, login_pwd, created_by, updated_by)
    VALUE(2419, 'system-admin', 'system-admin', 2419, 2419);

-- 在整个系统添加一个默认的系统租户(id: 5729)
INSERT INTO suyh_iam_tenant(tenant_id, tenant_name, tenant_description)
VALUE('system', 'eel-system', '系统租户');

-- 添加系统默认角色
INSERT INTO suyh_iam_role(tenant_id, role_code, role_name, role_description, system_role)
    VALUE('eel-system', 'admin', '租户管理员', '最高权限', 'true');
INSERT INTO suyh_iam_role(tenant_id, role_code, role_name, role_description, system_role)
    VALUE('eel-system', 'manager', '操作管理员', '一般操作管理权限', 'true');
INSERT INTO suyh_iam_role(tenant_id, role_code, role_name, role_description, system_role)
    VALUE('eel-system', 'operator', '操作员', '一些操作相关的权限，但是不能修改系统里面的一些参数，比如操作角色，用户等', 'true');
INSERT INTO suyh_iam_role(tenant_id, role_code, role_name, role_description, system_role)
    VALUE('eel-system', 'reader', '只读', '只有查看的权限', 'true');

-- 为系统管理员用户绑定系统管理员角色
INSERT INTO suyh_iam_mapping_user_role(tenant_id, user_id, role_code)
    VALUE('eel-system', 2419, 'admin');

-- 为系统管理员用户绑定系统租户
INSERT INTO suyh_iam_mapping_user_tenant(tenant_id, user_id)
    VALUE('eel-system', 2419);





