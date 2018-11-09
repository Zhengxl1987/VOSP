--[[
    正则： 复制%  [1]
    示例：复制1234567890
]]
if (runtime.DEBUG) then
    -- args = {"123"}
end
arg = args[1]
if (not arg) then
    speakSync("复制什么")
    arg = waitForVoiceParam()
end
if (arg) then
    system.setClipText(arg)
    speak("已复制")
else
    speak("无复制内容")
end
