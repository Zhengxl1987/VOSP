--[[
    正则：
    @{date}叫我@{todo} 
    %定个?闹钟@{date}
    %定个@{date}的闹钟
    %设个@{date}的闹钟
]]
if (runtime.DEBUG) then
    -- argMap["date"] = "明天上午七点半"
    -- argMap["todo"] = "起床"
    argMap["date"] = "每天早上5点"
    argMap["todo"] = "起床"
    runtime.command = "每天早上5点叫我"
    -- argMap["date"] = "两小时后"
    -- argMap["todo"] = "喝水"
end
dateText = argMap["date"]
todo = argMap["todo"]
if (not dateText) then
    speakSync("什么时候")
    dateText = waitForVoiceParam()
end
local date = parseDateText(dateText) -- 解析日期
if(not date) then -- 解析失败
    notSupport()
end

local hour = date.get(Calendar.HOUR_OF_DAY) -- 24小时制
local minute = date.get(Calendar.MINUTE) -- 分
local dayOfWeek = date.get(Calendar.DAY_OF_WEEK) -- 周

local today = Calendar.getInstance()
local nowHour = today.get(Calendar.HOUR_OF_DAY)
local nowM = today.get(Calendar.MINUTE)
local todayWeek = today.get(Calendar.DAY_OF_WEEK)
print(hour, minute, dayOfWeek)
if (string.find(runtime.command, "每天")) then
    days = {1, 2, 3, 4, 5, 6, 7}
elseif todayWeek + 1 <= dayOfWeek then-- 日 --> 六
    days = nil
else
    days = {dayOfWeek}
end
r = system.createAlarm(todo, days, hour, minute, false)
if r then
    speak("创建闹钟完成")
else
    speak("创建闹钟失败")
end
