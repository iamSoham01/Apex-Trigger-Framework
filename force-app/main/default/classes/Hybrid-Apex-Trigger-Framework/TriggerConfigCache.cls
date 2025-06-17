public class TriggerConfigCache {

    public static List<Trigger_Handler_Config__mdt> getHandlers(String objectName, TriggerOperation eventType) {
        return [
            SELECT Handler_Class__c, Active__c, Dispatch_Enabled__c
            FROM Trigger_Handler_Config__mdt
            WHERE Object_Name__c = :objectName
              AND Trigger_Event__c = :eventType.name()
            ORDER BY Execution_Order__c ASC
        ];
    }
    
}