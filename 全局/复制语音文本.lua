--[[
    正则： 复制@{text}
    示例：复制1234567890
]]
if (runtime.DEBUG) then
    argMap["text"] = "我是要复制的内容"
end
text = argMap["text"]
if (not text) then
    speakSync("复制什么")
    text = waitForVoiceParam()
end
if (text) then
    system.setClipText(text)
    speak("已复制")
else
    toast("无复制内容")
end
