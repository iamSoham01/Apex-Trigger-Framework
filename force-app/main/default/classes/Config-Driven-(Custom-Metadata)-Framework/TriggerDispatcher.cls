public class TriggerDispatcher {

    public static void execute(String objectName, Boolean isBefore, Boolean isAfter, Boolean isInsert, Boolean isUpdate, Boolean isDelete, List<SObject> newList, List<SObject> oldList, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {

        String event = getTriggerEvent(isBefore, isAfter, isInsert, isUpdate, isDelete);

        List<Trigger_Handler_Config__mdt> config = [
            SELECT Handler_Class__c
            FROM Trigger_Handler_Config__mdt
            WHERE Object_Name__c = :objectName
              AND Trigger_Event__c = :event
              AND Active__c = true
              Limit 1
        ];

        ITriggerHandler handler = (ITriggerHandler) Type.forName(config.Handler_Class__c).newInstance();
        handler.run(newList, oldList, newMap, oldMap);
        
    }

    private static String getTriggerEvent(Boolean isBefore, Boolean isAfter, Boolean isInsert, Boolean isUpdate, Boolean isDelete) {
        if (isBefore && isInsert) return 'BEFORE_INSERT';
        if (isBefore && isUpdate) return 'BEFORE_UPDATE';
        if (isBefore && isDelete) return 'BEFORE_DELETE';
        if (isAfter && isInsert) return 'AFTER_INSERT';
        if (isAfter && isUpdate) return 'AFTER_UPDATE';
        if (isAfter && isDelete) return 'AFTER_DELETE';
        throw new TriggerContextException('Unsupported trigger event');
    }

}
