local packageName = "com.eg.android.AlipayGphone"
local cmd = '支付宝扫一扫'

function getAppName(packageName)
    import 'com.google.gson.JsonParser'
    local result = http.get('http://vassist.vove7.cn:8082/coolapk/'..packageName)
    if result then
        local arr = JsonParser().parse(result)
        return arr.get(0).asString
    else 
        return packageName
    end
end

if not system.hasInstall(packageName) then
    app.toastError('请先安装 ['.. getAppName(packageName)..']', 1)
    return
end

result = utils.runAppCommand(packageName, cmd, argMap)
if not result then
    toast("指令 ["..cmd.."] 未找到")
end
