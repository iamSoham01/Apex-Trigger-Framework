public interface ITriggerHandler {
    
    void run(List<SObject> newList, List<SObject> oldList, Map<Id, SObject> newMap, Map<Id, SObject> oldMap);

}
