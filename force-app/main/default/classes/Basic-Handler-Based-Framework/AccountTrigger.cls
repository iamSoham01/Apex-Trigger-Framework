trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete) {

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            AccountTriggerHandler.beforeInsert(Trigger.new);
        }
        if (Trigger.isUpdate) {
            AccountTriggerHandler.beforeUpdate(Trigger.new, Trigger.old);
        }
        if (Trigger.isDelete) {
            AccountTriggerHandler.beforeDelete(Trigger.old);
        }
    }

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            AccountTriggerHandler.afterInsert(Trigger.new);
        } 
        if (Trigger.isUpdate) {
            AccountTriggerHandler.afterUpdate(Trigger.new, Trigger.old);
        }
        if (Trigger.isDelete) {
            AccountTriggerHandler.afterDelete(Trigger.old);
        }
    }

}
