--[[
    点击@{text}
]]
requireAccessibility()
if runtime.DEBUG then
    argMap["text"] = "111"
end

text = argMap["text"]
if(String(text).length() > 3) then
    a = containsText(text).findFirst()
    print(a)
    if(a) then
        if(a.tryClick()) then
            return
        end
    end
    a = containsDesc(text).findFirst()
    print(a)
    if(a) then
        if(a.tryClick()) then
        return
        end
    end
else
    a = ViewFinder().equalsText(text).findFirst()
    if(a) then
        if(a.tryClick()) then
            return
        end
    end
end
toast("点击"..text.."失败")
