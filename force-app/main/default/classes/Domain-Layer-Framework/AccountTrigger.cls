trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete) {

    AccountDomain accountDomain = new AccountDomain(Trigger.isBefore, Trigger.isAfter, Trigger.isInsert, Trigger.isUpdate, Trigger.isDelete, Trigger.new, Trigger.old);

    accountDomain.execute();

}
