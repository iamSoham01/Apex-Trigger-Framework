public class TriggerContextParameters {

    public List<SObject> newList;
    public List<SObject> oldList;
    public Map<Id, SObject> oldMap;
    public Map<Id, SObject> newMap;
    public TriggerOperation operation;
    public String objectName;

    public TriggerContextParameters(String objectName, TriggerOperation operation, List<SObject> newList, Map<Id, SObject> oldMap) {

        this.objectName = objectName;
        this.operation = operation;
        this.newList = newList;
        this.oldMap = oldMap;
        this.oldList = (oldMap != null) ? new List<SObject>(oldMap.values()) : null;
        this.newMap = (newList != null) ? new Map<Id, SObject>(newList) : null;
        
    }
    
}