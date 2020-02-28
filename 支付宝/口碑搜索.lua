--[[
    口碑搜索@{name}
]]
if runtime.DEBUG then
    argMap['name'] = '122'
end
i = Intent()
i.data = Uri.parse('alipays://platformapi/startApp?appId=20000238&target=search&query='..argMap['name'])
app.startActivity(i)