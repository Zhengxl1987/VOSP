print(system.simCount) -- 插入的sim卡数量


-- 第二个参数为卡号    0：(默认)卡1； 1：卡2
system.call("10086", 1) --使用卡2 拨打电话

system.call("10086") -- 使用系统默认拨打