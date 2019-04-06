--[[
    正则：输入@{text}
]]
if (runtime.DEBUG) then
    argMap["text"] = "1234567"
end
text = argMap["text"]
local fv = runtime.focusView
if (fv and fv.classType == "EditText") then -- 判断当前获得焦点的View
    fv.setText(text)
else
    inputBox = ViewFinder().type("EditText").findFirst()
    if (inputBox) then
        inputBox.setText(text)
    else
        toast("未找到输入框")
    end
end
