--[[
    示例：调用 支付宝 的 花呗 指令
]]
result = utils.runAppCommand(system.getAppInfo('支付宝').packageName,'花呗')
if result then
    print('成功')
else 
    print('失败')
end
--[[
    带参数示例
]]
utils.runAppCommand(system.getAppInfo('网易云').packageName,'播放',{song="绝代风华"})
