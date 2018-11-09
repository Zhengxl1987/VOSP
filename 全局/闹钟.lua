--%叫我%
--定个?闹钟%
if (runtime.DEBUG) then
    args = {"明天上午七点半", "起床"}
    args = {"两小时后", "喝水"}
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

local today = Calendar.getInstance()
local nowHour= today.get(Calendar.HOUR_OF_DAY)
local nowM= today.get(Calendar.HOUR_OF_DAY)
if todayWeek==dayOfWeek and nowHour*60+nowM >= hour*60+minute then -- 今天已过去/ 设为明天
    days=nil
    print(hour, minute, dayOfWeek)
elseif (string.find(runtime.command, "每天")) then
    days = {1, 2, 3, 4, 5, 6, 7}-- 日 --> 六
else
    days = {dayOfWeek}
end
r = system.createAlarm(args[2], days, hour, minute, false)
if r then
    speak("创建闹钟完成")
else
    speak("创建闹钟失败")
end
