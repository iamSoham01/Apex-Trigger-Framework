public class AccountTriggerHandler {

    public void run(TriggerOperationType context, List<SObject> newList, List<SObject> oldList) {

        List<Account> newRecords = (List<Account>) newList;
        List<Account> oldRecords = (List<Account>) oldList;

        switch on context {

            when BEFORE_INSERT {
                beforeInsert(newRecords);
            }
            when BEFORE_UPDATE {
                beforeUpdate(newRecords, oldRecords);
            }
            when BEFORE_DELETE {
                beforeDelete(oldRecords);
            }
            when AFTER_INSERT {
                afterInsert(newRecords);
            }
            when AFTER_UPDATE {
                afterUpdate(newRecords, oldRecords);
            }
            when AFTER_DELETE {
                afterDelete(oldRecords);
            }
            
        }
    }

    private void beforeInsert(List<Account> records) {
        // Add logic here
    }

    private void beforeUpdate(List<Account> newRecords, List<Account> oldRecords) {
        // Add logic here
    }

    private void beforeDelete(List<Account> records) {
        // Add logic here
    }

    private void afterInsert(List<Account> records) {
        // Add logic here
    }

    private void afterUpdate(List<Account> newRecords, List<Account> oldRecords) {
        // Add logic here
    }

    private void afterDelete(List<Account> records) {
        // Add logic here
    }

}
