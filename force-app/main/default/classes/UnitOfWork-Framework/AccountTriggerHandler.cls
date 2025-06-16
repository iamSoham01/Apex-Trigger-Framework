public class AccountTriggerHandler {

    private Boolean isBefore;
    private Boolean isAfter;
    private Boolean isInsert;
    private Boolean isUpdate;
    private Boolean isDelete;

    private List<Account> newList;
    private List<Account> oldList;
    private IUnitOfWork uow;

    public AccountTriggerHandler(Boolean isBefore, Boolean isAfter, Boolean isInsert, Boolean isUpdate, Boolean isDelete, List<Account> newList, List<Account> oldList) {
        this.isBefore = isBefore;
        this.isAfter = isAfter;
        this.isInsert = isInsert;
        this.isUpdate = isUpdate;
        this.isDelete = isDelete;
        this.newList = newList;
        this.oldList = oldList;
        this.uow = new SimpleUnitOfWork();
    }

    public void execute() {
        if (isBefore && isInsert) handleBeforeInsert();
        if (isAfter && isInsert) handleAfterInsert();

        // Add other event handlers...

        uow.commitWork(); // Commit all collected changes at once
    }

    private void handleBeforeInsert() {

        for (Account acc : newList) {
            acc.Description = 'Handled in UOW';
            // uow.registerDirty(acc); //Don't write DML in Before Trigger
        }

    }

    private void handleAfterInsert() {

        List<Contact> contacts = new List<Contact>();
        for (Account acc : newList) {
            contacts.add(new Contact(
                LastName = acc.Name + ' Contact',
                AccountId = acc.Id
            ));
        }
        for (Contact con : contacts) {
            uow.registerNew(con);
        }

    }

}
