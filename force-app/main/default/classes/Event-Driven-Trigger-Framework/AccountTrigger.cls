trigger AccountTrigger on Account (after insert, after update, after delete) {

    List<Account_Change_Event__e> events = new List<Account_Change_Event__e>();

    for (Account acc : Trigger.new) {
        events.add(new Account_Change_Event__e(
            Event_Type__c = Trigger.isInsert ? 'AFTER_INSERT' :
                            Trigger.isUpdate ? 'AFTER_UPDATE' :
                            Trigger.isDelete ? 'AFTER_DELETE' : '',
            Record_Id__c = acc.Id,
            Account_Name__c = acc.Name,
            Description__c = acc.Description
        ));
    }

    if (!events.isEmpty()) {
        EventBus.publish(events);
    }

}
