public class SimpleUnitOfWork implements IUnitOfWork {

    private List<SObject> toInsert = new List<SObject>();
    private List<SObject> toUpdate = new List<SObject>();
    private List<SObject> toDelete = new List<SObject>();

    public void registerNew(SObject record) {
        toInsert.add(record);
    }

    public void registerDirty(SObject record) {
        toUpdate.add(record);
    }

    public void registerDeleted(SObject record) {
        toDelete.add(record);
    }

    public void commitWork() {
        if (!toInsert.isEmpty()) insert toInsert;
        if (!toUpdate.isEmpty()) update toUpdate;
        if (!toDelete.isEmpty()) delete toDelete;
    }
    
}
