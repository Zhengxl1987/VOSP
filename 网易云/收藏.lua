-- 正则： 收藏%
-- Activity： PlayerActivity
require 'accessibility'
-- 判断是否进入主页
if (not String(runtime.currentActivity).endsWith("PlayerActivity")) then
    -- 进入播放页
    playBar = ViewFinder().desc("mini播放条").waitFor(2000)
    playBar.tryClick()
end

rh = ViewFinder().desc("红心").waitFor(1000)
rh.tryClick() -- todo 根据颜色判断
