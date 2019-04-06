--[[
    正则：
    返回%
]]
requireAccessibility()

if runtime.DEBUG then
    runtime.command = "返回到主页"
end
s = String(runtime.command).endsWith("主页")
if s then
    home()
else
    back()
end