--[[
    正则：重启%{,3}
    需要Root权限
]]
speakSync("是否继续")
r = alert("重启(Root)","是否继续？")
if(r) then
    androRuntime.execWithSu("reboot")
end

