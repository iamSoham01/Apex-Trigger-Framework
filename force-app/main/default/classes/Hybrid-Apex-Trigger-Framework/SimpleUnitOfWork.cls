public class SimpleUnitOfWork implements IUnitOfWork {

    private List<SObject> inserts = new List<SObject>();
    private List<SObject> updates = new List<SObject>();
    private List<SObject> deletes = new List<SObject>();

    public void registerNew(SObject record) { inserts.add(record); }
    public void registerDirty(SObject record) { updates.add(record); }
    public void registerDeleted(SObject record) { deletes.add(record); }

    public void commitWork() {
        if (!inserts.isEmpty()) insert inserts;
        if (!updates.isEmpty()) update updates;
        if (!deletes.isEmpty()) delete deletes;
    }
    
}