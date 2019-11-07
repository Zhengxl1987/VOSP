--[[
    正则：关机
    需要Root权限
]]
speakSync("是否继续")
r = alert("关机(Root)","是否继续？")
if(r) then
    androRuntime.execWithSu("poweroff")
end