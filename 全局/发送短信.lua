--[[
    正则: 给%发送?短信(内容[为是]?)?%  [1,-1]
    发短信给%   [1] 
    app: v1.2.7+
]]
if runtime.DEBUG then
    args = {"电信", "查话费"}
    -- args = {"电信内容为查流量"}
end
pName = args[1]
tmp = matchValues(pName, "%内容[为|是]?%") -- 适配 发消息给%(内容为)?%
if (tmp) then
    print(arr2String(tmp))
    pName = tmp[0]
    msgContent = tmp[1]
else
    msgContent = args[2]
end
system.sendSMS(system.getPhoneByName(pName), msgContent)
