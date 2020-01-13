--[[
    执行 Tasker 任务
    Tasker 需后台运行
    task_name 必须保持一致
    regex: 执行任务@{task_name}
]]


if runtime.DEBUG then
    argMap['task_name'] = "WIFI设置"
end

if (AppConfig.INSTANCE.versionCode < 20100) then
    toast("请更新至最新版本")
    return
end

import 'cn.vove7.common.bridges.UtilBridge'

UtilBridge.runTask(argMap['task_name'])