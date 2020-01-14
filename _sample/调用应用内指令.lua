--[[
    示例：调用 支付宝 的 花呗 指令
]]
utils.runAppCommand(system.getAppInfo('支付宝').packageName,'花呗')

--[[
    带参数示例
]]
utils.runAppCommand(system.getAppInfo('网易云').packageName,'播放',{song="绝代风华"})
