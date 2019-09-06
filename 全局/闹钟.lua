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

    argMap["date"] = "两小时后"
    argMap["todo"] = "喝水"
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
local nowM = today.get(Calendar.HOUR_OF_DAY)
if todayWeek == dayOfWeek and nowHour * 60 + nowM >= hour * 60 + minute then -- 今天已过去/ 设为明天
    days = nil
    print(hour, minute, dayOfWeek)
elseif (string.find(runtime.command, "每天")) then
    -- 日 --> 六
    days = {1, 2, 3, 4, 5, 6, 7}
else
    days = {dayOfWeek}
end
r = system.createAlarm(todo, days, hour, minute, false)
if r then
    speak("创建闹钟完成")
else
    speak("创建闹钟失败")
end
