import "cn.vove7.common.appbus.AppBus"
import "cn.vove7.common.appbus.SpeechAction"
--[[
    退下
    结束长语音识别
]]
AppBus.INSTANCE.post('cancel_recog')
