public class TriggerContextFactory {

    public static TriggerContext newContext(Boolean isBefore, Boolean isAfter, Boolean isInsert, Boolean isUpdate, Boolean isDelete, List<SObject> newList, List<SObject> oldList, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {

        TriggerContext ctx = new TriggerContext();
        ctx.isBefore = isBefore;
        ctx.isAfter = isAfter;
        ctx.isInsert = isInsert;
        ctx.isUpdate = isUpdate;
        ctx.isDelete = isDelete;
        ctx.newList = newList;
        ctx.oldList = oldList;
        ctx.newMap = newMap;
        ctx.oldMap = oldMap;
        return ctx;
        
    }

}
