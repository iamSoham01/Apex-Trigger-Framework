trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete) {
    
    TriggerOperation operation;
    if (Trigger.isBefore) {
        if (Trigger.isInsert) operation = TriggerOperation.BEFORE_INSERT;
        else if (Trigger.isUpdate) operation = TriggerOperation.BEFORE_UPDATE;
        else if (Trigger.isDelete) operation = TriggerOperation.BEFORE_DELETE;
    } else {
        if (Trigger.isInsert) operation = TriggerOperation.AFTER_INSERT;
        else if (Trigger.isUpdate) operation = TriggerOperation.AFTER_UPDATE;
        else if (Trigger.isDelete) operation = TriggerOperation.AFTER_DELETE;
    }

    TriggerDispatcher.dispatch('Account', operation, Trigger.isDelete ? Trigger.old : Trigger.new, Trigger.oldMap);
    
}