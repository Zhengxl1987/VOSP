type = runtime.commandType
if (runtime.DEBUG) then
    type = -1
end
if (type == 1) then
    AppBus.INSTANCE.post("start_wakeup")
elseif type == -1 then
    AppBus.INSTANCE.post("stop_wakeup")
end
