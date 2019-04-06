--[[
    点击@{text}
]]
requireAccessibility()
if runtime.DEBUG then
    argMap["text"] = "选择脚本"
end
clickText(argMap["text"])
