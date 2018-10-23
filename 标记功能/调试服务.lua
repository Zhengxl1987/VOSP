import "cn.vove7.common.appbus.AppBus"
-- 正则： (远程)?调试(服务)?

action = {
    [-1] = function()
        -- 关闭
        AppBus.INSTANCE.post("stop_debug_server")
    end,
    [1] = function()
        -- 打开
        AppBus.INSTANCE.post("start_debug_server")
    end
}
s = action[runtime.commandType]
if (s) then
    s()
end
