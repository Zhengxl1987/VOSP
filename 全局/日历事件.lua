--[[
   正则：
   @{date}提醒我@{todo} 
   @{date}通知我@{todo}
]]

settings = {
    earlyAlarm = {
        title = "提醒时间",
        summary = "默认提前10分钟，单位：分钟 ",
        t = "single_choice",
        items = {"事件发生时", "提前1分钟", "提前5分钟", "提前10分钟", "提前15分钟", "提前20分钟", "提前30分钟", "提前1小时", "提前2小时", "提前12小时", "提前1天"}
    }
}

config = registerSettings("calendar_event_config", settings, 1)
if (runtime.DEBUG) then
    -- runtime.command='后天早上九点提前10分钟提醒我开会'
    runtime.command='后天早上九点提醒我睡觉'
    argMap['date'] = "后天早上九点"
    argMap['todo'] = "开会"
    -- runtime.command='提前1个小时后天早上九点提醒我开会'
    -- runtime.command='提前1天后天早上九点提醒我开会'
end
dateText = argMap['date']
event = argMap['todo']

if (not dateText) then
    speakSync("什么时候")
    dateText = waitForVoiceParam()
end
if not event then
    speakSync("提醒什么")
    event = waitForVoiceParam()
end
if (not event or not dateText) then
    speak("创建失败")
    return
end

local date = parseDateText(dateText) -- 解析日期
-- 提醒时间
local ts = {}
ts["事件发生时"] = 0
ts["提前1分钟"] = 1
ts["提前5分钟"] = 5
ts["提前10分钟"] = 10
ts["提前15分钟"] = 15
ts["提前20分钟"] = 20
ts["提前30分钟"] = 30
ts["提前1小时"] = 60
ts["提前2小时"] = 120
ts["提前12小时"] = 720
ts["提前1天"] = 1440
earlyAlarmTime = ts[config.getString("earlyAlarm")]
if (string.find(runtime.command, "提前")) then -- 解析命令中的“提前xx”
    local ss = {"%提前#分钟%", "%提前#个?小时%", "%提前#天%"}
    local sss = {1, 60, 1440}
    local b = false
    for i, v in pairs(ss) do
        local r = matchValues(runtime.command, v)
        if (r) then
            earlyAlarmTime = sss[i] * r[1]
            b = true
            break
        end
    end
    if (not b) then
        local r = matchValues(runtime.command, "%提前半小时%")
        if (r) then
            earlyAlarmTime = 30
        end
    end
end
print("提前时间", earlyAlarmTime)
system.createCalendarEvent(event, event, date.time.time, nil, long(earlyAlarmTime))

speak("创建日历事件完成")
