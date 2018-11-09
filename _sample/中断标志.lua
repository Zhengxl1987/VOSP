--[[
    runtime.userInterrupted
    此标志用于在脚本长时间循环操作
    用户终止的标志
]]
-- 点击 停止 按钮 或长按音量下键终止操作
while (not runtime.userInterrupted) do
    print("doing..")
    sleep(500)
end
print("用户终止")
