public class TriggerContext {

    public Boolean isBefore, isAfter, isInsert, isUpdate, isDelete;
    public List<SObject> newList, oldList;
    public Map<Id, SObject> newMap, oldMap;
    public IUnitOfWork uow = new SimpleUnitOfWork();

    public String getEventKey() {
        if (isBefore && isInsert) return 'BEFORE_INSERT';
        if (isBefore && isUpdate) return 'BEFORE_UPDATE';
        if (isBefore && isDelete) return 'BEFORE_DELETE';
        if (isAfter && isInsert)  return 'AFTER_INSERT';
        if (isAfter && isUpdate)  return 'AFTER_UPDATE';
        if (isAfter && isDelete)  return 'AFTER_DELETE';
        return null;
    }
    
}
