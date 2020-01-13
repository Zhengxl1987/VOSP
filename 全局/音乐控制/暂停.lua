--[[
    regex: 暂停(播放)?
]]
AppBus.INSTANCE.post('cancel_recog')
system.mediaPause()