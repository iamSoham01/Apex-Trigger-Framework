trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete) {

    TriggerDispatcher.execute('Account', Trigger.isBefore, Trigger.isAfter, Trigger.isInsert, Trigger.isUpdate, Trigger.isDelete, Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);

}
