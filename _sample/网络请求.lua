import 'com.google.gson.JsonParser'

local result = http.get('http://vassist.vove7.cn:8082/coolapk/com.eg.android.AlipayGphone')
-- ["支付宝","10.1.85.7000","85.3M","1156万下载","1.2万人关注","2.3万个评论","简体中文"]
-- 解析为数组
if result then
    local arr = JsonParser().parse(result)
    print(arr)
    print(arr.get(0).asString) -- 输出应用名
else 
    print("网络错误")
end