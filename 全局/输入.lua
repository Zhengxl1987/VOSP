
--[[
    正则：输入%  [-1]
    app: v1.2.7+
]]
if (runtime.DEBUG) then
    args = {"1234567"}
end

local fv = runtime.focusView
if(fv and fv.classType=='EditText') then -- 判断当前获得焦点的View
    fv.setText(args[1])
    return
end

ViewFinder().type('EditText').findFirst().setText(args[1])

