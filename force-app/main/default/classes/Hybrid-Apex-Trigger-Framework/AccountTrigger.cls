trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete) {

    if (TriggerRecursionGuard.shouldRun('Account')) {
        TriggerRecursionGuard.markRun('Account');
        TriggerContext ctx = TriggerContextFactory.newContext(
            Trigger.isBefore, Trigger.isAfter,
            Trigger.isInsert, Trigger.isUpdate, Trigger.isDelete,
            Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap
        );
        TriggerDispatcher.execute('Account', ctx);
    }
    
}
