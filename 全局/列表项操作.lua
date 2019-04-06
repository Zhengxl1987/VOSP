--[[
    正则:
    @{text}第@{#index}个
]]
import "cn.vove7.common.utils.TextDateParser"

requireAccessibility() --需要无障碍，未开启则异常终止
if (runtime.DEBUG) then
    -- args = {"下载", "1"}
    argMap['text'] = "点击"
    -- argMap['text'] = "下载"
    argMap['index'] = 1
end
local index = argMap['index'] - 1
local text = argMap['text']
print(index)

--搜索 列表
list = ViewFinder().type({"ListView", "RecyclerView", "AbsListView"}).findFirst()

-- list.childs只包含可见的ViewNode
if (list) then
    if (not text or text == "" or text == "点击") then
        list.childs[index].tryClick()
    else
        local t = list.childs[index].finder().similaryText(text).findFirst()
        if (t) then
            t.tryClick()
        else --无脑点击
            list.childs[index].tryClick()
        end
    end
else
    speak("未发现列表项")
end
