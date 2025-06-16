trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete) {

    TriggerDispatcher.dispatch(TriggerContextUtils.getContext(), Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);

}
