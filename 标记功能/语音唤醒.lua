import "cn.vove7.common.appbus.AppBus"
import "cn.vove7.common.appbus.SpeechAction"
type = runtime.commandType
if (runtime.DEBUG) then
    type = 1
end
print(type)
if (type == 1) then
    AppBus.INSTANCE.post(SpeechAction(SpeechAction.ActionCode.ACTION_START_WAKEUP))
elseif type == -1 then
    AppBus.INSTANCE.post(SpeechAction(SpeechAction.ActionCode.ACTION_STOP_WAKEUP))
end
