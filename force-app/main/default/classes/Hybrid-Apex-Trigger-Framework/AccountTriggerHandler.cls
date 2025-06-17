public class AccountTriggerHandler implements ITriggerHandler {

    public void handle(TriggerContextParameters context) {
        if (context.operation == TriggerOperation.BEFORE_INSERT) {
            for (SObject sobj : context.newList) {
                Account acc = (Account) sobj;
                acc.Name = acc.Name != null ? acc.Name + ' [Verified]' : 'Default Account';
            }
        }

        if (context.operation == TriggerOperation.AFTER_INSERT) {
            // Example: Fire platform event or async logic
            System.debug('Inserted Account IDs: ' + context.newMap.keySet());
        }
    }
    
} 