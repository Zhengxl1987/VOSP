--[[
    regex: (开始|继续)播放   |   继续
]]
AppBus.INSTANCE.post('cancel_recog')
system.mediaResume()