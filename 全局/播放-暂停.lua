--[[
    需要音乐软件 打开启线控
    模拟一次耳机中键
]]
AppBus.INSTANCE.post('cancel_recog')
system.sendKey(79)