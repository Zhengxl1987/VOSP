--[[
    /**
     * 等待View消失  |  常用于等待加载View的消失
     * @param waitMs max 60s  默认10s
     * @return Boolean false 超时 true 消失
     */
    fun waitHide(waitMs: Int): Boolean 
]]
requireAccessibility()

result = ViewFinder().equalsText("支付宝").waitHide(5000) -- 等待'支付宝'文字消失 等待时间5s

print("等待结果： " , result) -- 在5s内消失  result:true  等待超时 result:false
if(not result) then
    notifyFailed("未消失")
end
print("over")
