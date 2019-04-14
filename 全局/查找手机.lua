--[[
    正则：你在哪里|查找手机
    用于手机不在身边时，使用此指令找手机位置；将音量调至80%，并回复
]]
settings = {
    speak_text = {title = "回复", t = "string", default = "我在这里"}
}
config = registerSettings('inst_where_are_you',settings, 1)

import "cn.vove7.jarvis.tools.AppConfig"
if (not AppConfig.voiceWakeup) then
    toast("未开启语音唤醒")
    return
end

system.setMusicVolume(system.musicMaxVolume * 0.7)
speak(config.getString('speak_text'))
