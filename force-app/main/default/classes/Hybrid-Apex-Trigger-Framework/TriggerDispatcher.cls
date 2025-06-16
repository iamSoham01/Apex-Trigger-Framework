public class TriggerDispatcher {

    public static void execute(String objectName, TriggerContext context) {
        String eventKey = context.getEventKey();

        List<Trigger_Handler_Config__mdt> handlers = [
            SELECT Handler_Class__c, Execution_Order__c
            FROM Trigger_Handler_Config__mdt
            WHERE Object_Name__c = :objectName
              AND Trigger_Event__c = :eventKey
              AND Active__c = true
            ORDER BY Execution_Order__c ASC
        ];

        for (Trigger_Handler_Config__mdt config : handlers) {
            Type handlerType = Type.forName(config.Handler_Class__c);
            if (handlerType == null) continue;

            ITriggerHandler handler = (ITriggerHandler) handlerType.newInstance();
            handler.handle(context);
        }

        context.uow.commitWork(); // Commit all at once
    }
    
}
