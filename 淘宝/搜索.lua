--[[
    正则：搜索@{name}

    用淘宝搜索...
]]
import "java.net.URLEncoder"

if runtime.DEBUG then
    argMap["name"] = "手机"
end

-- 商品名 通过UrlEncoede
local name = URLEncoder.encode(argMap["name"], "utf-8")

-- 使用Url绑定方式开启淘宝搜索Activity
local i = Intent(Intent.ACTION_VIEW, Uri.parse("https://s.m.taobao.com/h5?q=" .. name))

-- 查询支持打开此Intent的Activity信息
-- list = app.packageManager.queryIntentActivities(i, 0)
-- print(list)

i.component = ComponentName("com.taobao.taobao", "com.taobao.search.sf.MainSearchResultActivity")
app.startActivity(i)
