public class TriggerDispatcher {

    public static void dispatch(TriggerOperationType context, List<SObject> newList, List<SObject> oldList, Map<Id, SObject> newMap, Map<Id, SObject> oldMap
    ) {

        SObjectType sObjectType = newList != null && !newList.isEmpty()
                                  ? newList[0].getSObjectType()
                                  : oldList[0].getSObjectType();

        if (sObjectType == Account.SObjectType) {
            new AccountTriggerHandler().run(context, newList, oldList);
        }

        // Add more SObject conditionals here (Contact, Case, etc.)
    }

}
