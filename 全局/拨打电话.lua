--[[
    正则：
     呼叫%
     给%打电话
     打电话给%

     支持未知联系人标记
]]
settings = {
    card_id = {title = "选择拨打卡号", t = "single_choice", items = {"询问", "默认", "卡1", "卡2"}}
}
config = registerSettings("system_call", settings, 1)

if runtime.DEBUG then
    -- args = {"移动"}
-- args = {"1234"}
end
arg = args[1]

if (not arg) then
    speakSync("拨打给谁")
    arg = waitForVoiceParam()
end
if (not arg or arg == "") then --无参数
    return
end
phone = system.getPhoneByName(arg)
if (not phone) then --查找失败
    if (not alert("未识别该联系人", "选择是否标记该联系人: " .. arg)) then
        return
    end
    contacts = system.contacts -- 联系人数组 类型 ：Array<Pair<String(联系人名),String(phone)>>
    local selectIndex = executor.singleChoiceDialog("选择要标识的联系人", contacts) --选择的数据
    if (not selectIndex) then --未选择
        return
    end
    phone = contacts[selectIndex].second -- 电话
    -- 添加到联系人标记
    system.saveMarkedContact(arg, arg, phone)
    print(phone)
end
local ss = {}
ss["卡1"] = 0
ss["卡2"] = 1
id = nil -- 卡号
c_id = config.getString("card_id") --设置的值
if (c_id == "默认") then
    id = nil
elseif c_id == "询问" and system.simCount >= 2 then -- sim卡大于1 手动选择卡号
    id = singleChoiceDialog("选择卡", {"卡1", "卡2"}) -- [取消]会 抛出异常 终止
    if (not id) then --未选择
        return
    end
else --其他 默认
    id = ss[c_id]
end
print(phone, id)
system.call(phone, id)
