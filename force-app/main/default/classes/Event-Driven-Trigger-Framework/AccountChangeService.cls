public class AccountChangeService {

    public static void processEvent(Account_Change_Event__e event) {
        String type = event.Event_Type__c;
        String recordId = event.Record_Id__c;

        if (type == 'AFTER_INSERT') {
            // Sample Logic
            System.debug('New Account created: ' + event.Account_Name__c);
        } else if (type == 'AFTER_UPDATE') {
            // Business logic for update
        } else if (type == 'AFTER_DELETE') {
            // Deletion logic
        }
    }
    
}
