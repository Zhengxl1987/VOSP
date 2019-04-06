--[[
    正则:
    给@{receiver}发送?短信(内容[为是]?)?@{message}    
    发短信给@{receiver}内容[为是]@{message}
    发短信给@{receiver}
]]
if runtime.DEBUG then
    argMap["receiver"] = "移动"
    argMap["message"] = "查话费"
end
pName = argMap["receiver"]
msgContent = argMap["message"]

system.sendSMS(system.getPhoneByName(pName), msgContent)
