--%叫我%
--定个?闹钟%
if (runtime.DEBUG) then
    args = {"明天上午七点半", "起床"}
end
arg = args[1]
if (not arg) then
    speakSync("什么时候")
    arg = waitForVoiceParam()
end
local date = parseDateText(arg) -- 解析日期
local hour = date.get(Calendar.HOUR_OF_DAY) -- 24小时制
local minute = date.get(Calendar.MINUTE) -- 分
local dayOfWeek = date.get(Calendar.DAY_OF_WEEK) -- 周

print(hour, minute, dayOfWeek)
if (string.find(runtime.command, "每天")) then
    days = {1, 2, 3, 4, 5, 6, 7}-- 日 - 六
else
    days = {dayOfWeek}
end
system.createAlarm(args[2], days, hour, minute, true)

speak("创建完成")
