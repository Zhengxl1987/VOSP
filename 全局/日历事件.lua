--%提醒我%
--%通知我%

if (runtime.DEBUG) then
    args = {"后天早上九点", "开会"}
end
arg = args[1]
event = args[2]
if (not arg) then
    speakSync("什么时候")
    arg = waitForVoiceParam()
end
if not event then
    speakSync("提醒什么")
    event = waitForVoiceParam()
end
if (not event or not arg) then
    speak("创建失败")
    return
end
local date = parseDateText(arg) -- 解析日期

system.createCalendarEvent(event, event, date.time.time, nil, true)

speak("创建完成")
