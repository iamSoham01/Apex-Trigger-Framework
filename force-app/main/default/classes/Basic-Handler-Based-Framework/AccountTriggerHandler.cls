public class AccountTriggerHandler {

    public static void beforeInsert(List<Account> newList) {
        // Logic for before insert
    }

    public static void beforeUpdate(List<Account> newList, List<Account> oldList) {
        // Logic for before update
    }

    public static void beforeDelete(List<Account> oldList) {
        // Logic for before delete
    }

    public static void afterInsert(List<Account> newList) {
        // Logic for after insert
    }

    public static void afterUpdate(List<Account> newList, List<Account> oldList) {
        // Logic for after update
    }

    public static void afterDelete(List<Account> oldList) {
        // Logic for after delete
    }
}
