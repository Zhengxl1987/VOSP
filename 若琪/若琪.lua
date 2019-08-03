--[[
    若琪指令：若琪帮我...
    @{command}
]]
import "cn.vove7.common.app.AppConfig"
requireAccessibility()

if runtime.DEBUG then
    waitForApp(system.openAppByWord("若琪"))
    argMap["command"] = "一加五等于几"
end

if (AppConfig.INSTANCE.versionCode < 180) then
    toast("此指令仅支持1.9.4+版本")
    return
end


-- 判断是否登录
e = ViewFinder().editable().await(5000)
if (not e) then
    speakSync("请先登录")
end
--编辑框输入命令
e.text = argMap["command"]

-- 编辑框获取焦点
e.tryClick()
--发送默认响应事件（IME_ACTION_SEND）
print(input.sendDefaultEditorAction())

sleep(500)
--关闭输入法
input.restore()
sleep(2000)
--返回
back()
