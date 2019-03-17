--[[
    正则:
    %第#个
]]
import "cn.vove7.common.utils.TextDateParser"
if (runtime.DEBUG) then
    -- args = {"下载", "1"}
    args = {"点击", "1"}
-- args = {"更新", "1"}
end
local index = TextDateParser.INSTANCE.toNum(args[2])
local text = args[1]
print(index)

--搜索 列表
list = ViewFinder().type({"ListView","RecyclerView","AbsListView"}).findFirst()

-- list.childs只包含可见的ViewNode
if (list) then
    if (not text or text == "" or text == "点击") then
        list.childs[index].tryClick()
    else
        list.childs[index].finder().similaryText(text).findFirst().tryClick()
    end
else
    speak("未发现列表项")
end
