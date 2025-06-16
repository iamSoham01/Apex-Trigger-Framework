public class AccountDomain {

    private Boolean isBefore;
    private Boolean isAfter;
    private Boolean isInsert;
    private Boolean isUpdate;
    private Boolean isDelete;

    private List<Account> newList;
    private List<Account> oldList;

    public AccountDomain(Boolean isBefore, Boolean isAfter, Boolean isInsert, Boolean isUpdate, Boolean isDelete, List<Account> newList, List<Account> oldList) {

        this.isBefore = isBefore;
        this.isAfter = isAfter;
        this.isInsert = isInsert;
        this.isUpdate = isUpdate;
        this.isDelete = isDelete;
        this.newList = newList;
        this.oldList = oldList;
        
    }

    public void execute() {
        if (isBefore) {
            if (isInsert) beforeInsert();
            if (isUpdate) beforeUpdate();
            if (isDelete) beforeDelete();
        }

        if (isAfter) {
            if (isInsert) afterInsert();
            if (isUpdate) afterUpdate();
            if (isDelete) afterDelete();
        }
    }

    private void beforeInsert() {
        // Business logic for before insert
    }

    private void beforeUpdate() {
        // Business logic for before update
    }

    private void beforeDelete() {
        // Business logic for before delete
    }

    private void afterInsert() {
        // Business logic for after insert
    }

    private void afterUpdate() {
        // Business logic for after update
    }

    private void afterDelete() {
        // Business logic for after delete
    }

}
