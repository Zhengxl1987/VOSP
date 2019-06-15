if runtime.DEBUG then
    runtime.command = "ip"
end

lip = system.localIpAddress
s = ""
if (lip) then -- 有本地IP
    s = "本地IP：" .. lip..'。'
end
nip = system.netAddress
if (nip) then
    s = s .. "\n外网IP: " .. nip
end
if (s == "") then
    s = "获取IP失败"
end
speak(s)
