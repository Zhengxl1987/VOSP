--[[
    京东搜索商品
    正则：搜索@{name}
]]
if DEBUG then
    argMap["name"] = "京东"
end

kw = argMap["name"]
if not kw or kw == "" then
    speakSync("搜索什么")
    kw = waitForVoiceParam()
end
if not kw then
    return
end

i = Intent()
i.data =
    Uri.parse(
    'openapp.jdmobile://virtual?params={"des":"productList","keyWord":"' .. kw .. '","from":"search","category":"jump"}'
)
i.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
app.startActivity(i)
