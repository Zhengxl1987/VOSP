requireAccessibility()

s = ViewFinder().id('name').equalsText('消息')
p = s.waitFor()
p = p.parent
function clear()
    local redPoint = p.childs[1] -- 第二个为红点点
    redPoint.swipe(200, -200, 500)
    
end

local cnum = #p.childs
-- print(cnum)
if (cnum == 3) then
    clear()
else speak("无未读消息")
end